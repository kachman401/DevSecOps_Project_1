#!/bin/bash

# This script runs the Trivy vulnerability scanner against the specified Docker images or file paths.

# Set the image or path to scan
IMAGE=${1:-"your-image:latest"}

# Run Trivy scan
trivy image --severity HIGH,CRITICAL --exit-code 1 --no-progress $IMAGE

# Check the exit code of the Trivy scan
if [ $? -ne 0 ]; then
  echo "Vulnerabilities found in the image: $IMAGE"
  exit 1
else
  echo "No vulnerabilities found in the image: $IMAGE"
fi