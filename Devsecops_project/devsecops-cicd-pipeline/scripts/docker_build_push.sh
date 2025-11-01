#!/bin/bash

# Variables
IMAGE_NAME="your-docker-image-name"
REGISTRY_URL="your-container-registry-url"
TAG="latest"

# Build the Docker image
docker build -t $IMAGE_NAME:$TAG .

# Log in to the container registry
echo "Logging in to the container registry..."
echo $REGISTRY_PASSWORD | docker login $REGISTRY_URL -u $REGISTRY_USERNAME --password-stdin

# Push the Docker image to the registry
echo "Pushing the Docker image to the registry..."
docker push $IMAGE_NAME:$TAG

echo "Docker image built and pushed successfully."