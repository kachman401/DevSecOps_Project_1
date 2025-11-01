#!/bin/bash

# This script generates a Software Bill of Materials (SBOM) for the application.
# It uses the Syft tool to create the SBOM in JSON format.

# Check if Syft is installed
if ! command -v syft &> /dev/null
then
    echo "Syft could not be found. Please install Syft to generate SBOM."
    exit 1
fi

# Define the output file for the SBOM
OUTPUT_FILE="sbom.json"

# Generate the SBOM
syft dir:. --output json > $OUTPUT_FILE

echo "SBOM generated successfully: $OUTPUT_FILE"