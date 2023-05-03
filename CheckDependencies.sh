#!/bin/bash

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
