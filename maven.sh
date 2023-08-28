#!/bin/bash

# Update package list
sudo apt update -y

# Install Maven
sudo apt install maven -y

# Check if Maven installation was successful
if [ $? -eq 0 ]; then
    echo "Maven installed successfully"

    # Get the Maven installation path
    maven_path=$(which mvn)

    # Check if .profile file exists
    if [ -f ~/.profile ]; then
        # Check if the Maven path is already in .profile
        if ! grep -qF "$maven_path" ~/.profile; then
            # Add the Maven path to .profile
            echo "export PATH=\$PATH:$maven_path" >> ~/.profile
            echo "Maven path added to .profile"
            cd ~
            source .profile
        else
            echo "Maven path already exists in .profile"
        fi
    else
        echo ".profile file not found in the home directory"
    fi
else
    echo "Maven installation failed"
fi
