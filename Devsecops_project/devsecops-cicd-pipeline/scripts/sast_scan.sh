#!/bin/bash

# This script performs Static Application Security Testing (SAST) on the source code.

# Define the source code directory
SOURCE_DIR="../src/app"

# Run SAST tool (e.g., SonarQube scanner)
sonar-scanner -Dsonar.projectKey=my_project_key \
              -Dsonar.sources=$SOURCE_DIR \
              -Dsonar.host.url=http://localhost:9000 \
              -Dsonar.login=my_sonar_token

# Check the exit status of the sonar-scanner
if [ $? -ne 0 ]; then
    echo "SAST scan failed."
    exit 1
else
    echo "SAST scan completed successfully."
fi