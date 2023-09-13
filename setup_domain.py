import os
import subprocess
import sys

def setup_server(domain):
    # Create directory
    dir_path = f"/var/www/{domain}"
    os.makedirs(dir_path, exist_ok=True)

    # Create log directory
    log_dir_path = f"/var/www/{domain}/log"
    os.makedirs(log_dir_path, exist_ok=True)

    # Assign permissions
    subprocess.run(["sudo", "chmod", "-R", "774", dir_path], check=True)
    subprocess.run(["sudo", "chown", "-R", "www-data:www-data", dir_path], check=True)

    # Create virtual host file
    vhost_config = f"""
    <VirtualHost *:80>
        ServerName {domain}
        DocumentRoot /var/www/{domain}
        <Directory /var/www/{domain}>
            Options -Indexes
            AllowOverride All
            Require all granted
        </Directory>
        <FilesMatch \.php$>
            SetHandler application/x-httpd-php
        </FilesMatch>
        ErrorLog /var/www/{domain}/log/{domain}.log
        CustomLog /var/www/{domain}/log/{domain}_access.log combined
    </VirtualHost>
    """

    with open(f"/etc/apache2/sites-available/{domain}.conf", "w") as f:
        f.write(vhost_config)

    # Enable the site
    subprocess.run(["sudo", "a2ensite", f"{domain}.conf"], check=True)
    subprocess.run(["sudo", "systemctl", "reload", "apache2"], check=True)

# Use the function
if len(sys.argv) != 2:
    print("Usage: sudo python3 setup_server.py <domain>")
else:
    setup_server(sys.argv[1])

