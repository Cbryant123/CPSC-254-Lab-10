#!/bin/bash

# Ask the user for the expected hash value
echo "Enter the hash value from the github repo:"
read expected_hash

# Set the folder path
echo "Enter the path from the extracted zip for the ProjectRaceLinux 
ex:(/home/linuxtest/Downloads/ProjectRaceLinuxV3 )"
read folder_path

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder not found: $folder_path"
    exit 1
fi

# Calculate the combined hash value for the folder
local_hash_values=$(find "$folder_path" -type d -printf "%p\n" -o -type f -exec md5sum {} \; | sort)
local_combined_hash=$(echo "$local_hash_values" | md5sum | awk '{print $1}')


# Compare the hash values
if [ "$expected_hash" == "$local_combined_hash" ]; then
    echo "
Project is up-to-date!!!"
else
    echo "This is the path you entered:
    $folder_path 
    Project is outdated or Incorrect path, make sure it is the folder that contains the x86!"
fi

