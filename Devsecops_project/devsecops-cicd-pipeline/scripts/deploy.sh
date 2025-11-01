#!/bin/bash

# This script deploys the application to the specified environment using Kubernetes.

set -e

# Define variables
NAMESPACE="your-namespace"  # Change to your Kubernetes namespace
DEPLOYMENT_NAME="your-deployment"  # Change to your deployment name
IMAGE="your-image:latest"  # Change to your Docker image

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found. Please install it to proceed."
    exit 1
fi

# Deploy the application
echo "Deploying ${DEPLOYMENT_NAME} to namespace ${NAMESPACE}..."

kubectl set image deployment/${DEPLOYMENT_NAME} ${DEPLOYMENT_NAME}=${IMAGE} -n ${NAMESPACE}

# Check deployment status
kubectl rollout status deployment/${DEPLOYMENT_NAME} -n ${NAMESPACE}

echo "Deployment completed successfully."