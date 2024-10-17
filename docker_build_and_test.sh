#!/bin/bash

# Constants
DOCKERFILE_PATH="./Dockerfile"
IMAGE_NAME="aws-fcj-management"
CONTAINER_NAME="aws-fcj-management-container"
PORT="5000"

# Build the Docker image
echo "Building Docker image..."
docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" .

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Error: Docker build failed."
  exit 1
fi

# Run a container from the built image
echo "Running Docker container..."
docker run -d -p "$PORT":5000 --name "$CONTAINER_NAME" "$IMAGE_NAME"

# Check if the container is running
if [ $? -ne 0 ]; then
  echo "Error: Docker run failed."
  exit 1
fi

# Wait for the container to start
echo "Waiting for the container to start..."

# Use curl to check if the service inside the container is ready
while true; do
  if curl -s "http://localhost:$PORT/healthcheck" > /dev/null; then
    echo "Container is up and running."
    break
  fi
  sleep 1
done

# Clean up: stop and remove the container
echo "Stopping and removing the container..."
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"

# Clean up: remove the image
echo "Removing the Docker image..."
docker rmi "$IMAGE_NAME"

echo "Script completed."
