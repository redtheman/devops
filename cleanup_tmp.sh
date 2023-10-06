# This is a script to delete all jpg, jpeg and png files in specific folder. Now the devs of this app set it up to 
# cache images on the app server from the media server to make the app load the images faster. Now the problem is the images aren't deleted
# and eventually the servers storage gets filled up. Here is the bash script and cron job I wrote to delete the images every 24 hours
# Replace the path with the path in your environment.
#
vim cleanup_tmp.sh
# 
#!/bin/bash
# Replace the path with the path in your environment.

# Define the folders to clean
folders=(
  "/PATH"
  "/PATH"
  "/PATH"
  )

# Extensions to delete
extensions=("jpg" "jpeg" "png")

# Loop through folders and delete files
for folder in "${folders[@]}"; do
  for ext in "${extensions[@]}"; do
    find "$folder" -name "*.$ext" -type f -delete
  done
done

# After this make the script executable
chmod +x cleanup_tmp.sh
# you can test the script by running it
./cleanup_tmp.sh

# Then add the script to the crontab
crontab -e
# specify the corrent path

0 0 * * * /path/cleanup_tmp.sh
