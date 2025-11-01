#!/bin/bash

# This script runs unit tests for the application to ensure code quality.

# Navigate to the source directory
cd ../src/tests/unit

# Run the tests using the Go test command
go test -v ./... 

# Capture the exit status of the test command
TEST_STATUS=$?

# Exit with the same status as the test command
exit $TEST_STATUS