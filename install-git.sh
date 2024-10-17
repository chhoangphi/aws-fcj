#!/bin/bash

# Step 1: Update System Package
sudo dnf update -y

# Step 2: Search for Git Package
sudo dnf search git

# Step 3: Install Git
sudo dnf install git -y

# Step 4: Verify Git Installation
git --version

# Congratulations message
echo "Congratulations! Git is now installed on your Amazon Linux 2023 instance."