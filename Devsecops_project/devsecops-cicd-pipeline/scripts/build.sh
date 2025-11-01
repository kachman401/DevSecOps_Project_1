#!/bin/bash

# Build the application
echo "Building the application..."
go build -o myapp ./src/app/main.go

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Build failed!"
  exit 1
fi

echo "Build completed successfully."