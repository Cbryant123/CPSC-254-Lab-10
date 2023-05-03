#!/bin/bash

# Intro information
echo "This is the Lab 10 Bash directory"

# Key entering guidance
echo "Please select the Number related to the menu area you want to access::"
echo "0 Exit"
echo "1 Project Introduction"
echo "2 File Integrity Check Helper"
echo "3 Dependency Check Helper"
echo "4 Credits"

# Read user input
read choice

# Handle user input
case $choice in
  0)
    echo "Exiting MyShellScript..."
    ;;
  1)
    echo "This is the introduction to the project."
    echo "Our project is a simple racing game that features 3 levels"
    echo "It allows the player to drive the car around different racetracks with different cars"
    echo "each level is designed differently, with the intent of using different assets and practice of the mechanics"
    echo "The game is programmed and made in Unity, and uses all free assets, made purely in the pursuit of education and practice."
    ;;
  2)
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
        echo "Project is up-to-date!!!"
    else
        echo "This is the path you entered: $folder_path. Project is outdated or Incorrect path, make sure it is the folder that contains the x86!"
    fi
    ;;
  3)
    # List of dependencies required to run the project
    dependencies=(gconf-service lib32gcc1 lib32stdc++6 libasound2 libc6 libc6-i386 libcairo2)

    echo "Checking dependencies..."

    # Loop through each dependency
    for dependency in "${dependencies[@]}"
    do
        # Check if the dependency is available
        if command -v $dependency >/dev/null 2>&1; then
            echo "$dependency is already installed."
        else
            echo "Error: $dependency is not installed."
            echo "Attempting to install $dependency..."

            # Command to install the dependency (assuming apt-get package manager)
            if sudo apt-get install $dependency; then
                echo "Successfully installed $dependency."
            else
                echo "Failed to install $dependency. Please install it manually."
            fi
        fi
    done
    ;;
  4)
    echo "Credits:"
    echo "Chandler Bryant - cbryant126@csu.fullerton.edu"
    echo "Shawn Melwani - smelwani@csu.fullerton.edu"
    echo "Drake Nguyen - 18dnguyen@csu.fullerton.edu"
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
esac
