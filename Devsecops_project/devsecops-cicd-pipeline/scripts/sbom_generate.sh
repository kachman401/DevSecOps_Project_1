#!/bin/bash

# This script generates a Software Bill of Materials (SBOM) for the application.
# Uses Syft via Docker to avoid local installation requirements.

# Define the output file for the SBOM
OUTPUT_FILE="sbom.json"
OUTPUT_DIR="security/sbom"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "Generating SBOM using Syft in Docker..."

# Use Syft via Docker, mounting the src directory
docker run --rm \
    -v "$(pwd):/workspace" \
    -w /workspace \
    anchore/syft:latest \
    dir:src/app \
    -o json > "${OUTPUT_DIR}/${OUTPUT_FILE}"

# Check if SBOM was generated successfully
if [ -f "${OUTPUT_DIR}/${OUTPUT_FILE}" ]; then
    echo "SBOM generated successfully: ${OUTPUT_DIR}/${OUTPUT_FILE}"
    exit 0
else
    echo "Failed to generate SBOM"
    exit 1
fi
