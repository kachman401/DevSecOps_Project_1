#!/bin/bash

# This script runs the Trivy vulnerability scanner against the specified Docker images or file paths.

# Set the image or path to scan
IMAGE_TO_SCAN="your-image:latest"  # Replace with your Docker image or file path

# Run Trivy scan
trivy image --severity HIGH,CRITICAL --exit-code 1 --no-progress $IMAGE_TO_SCAN

# Check the exit code of the Trivy scan
if [ $? -ne 0 ]; then
  echo "Trivy scan found vulnerabilities!"
  exit 1
else
  echo "Trivy scan completed successfully. No high or critical vulnerabilities found."
fi