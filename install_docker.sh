#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Docker is already installed
if ! command_exists docker; then
  # Update the package list
  sudo dnf update -y

  # Install Docker
  sudo dnf install -y docker

  # Start and enable the Docker service
  sudo systemctl start docker.service
  sudo systemctl enable docker

  # Check Docker version
  docker --version

  # Allow the current user to run Docker commands without sudo (optional)
  sudo usermod -aG docker $USER
else
  echo "Docker is already installed."
fi

# Check if Docker Compose is already installed
if ! command_exists docker-compose; then
  # Install Docker Compose
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

  # Verify Docker Compose installation
  docker-compose --version
else
  echo "Docker Compose is already installed."
fi

# Print a message indicating the installation is complete
echo "Docker and Docker Compose have been installed."

