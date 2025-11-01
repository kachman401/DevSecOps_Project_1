# Makefile for DevSecOps CI/CD Pipeline

# Define variables
APP_NAME := myapp
DOCKER_IMAGE := $(APP_NAME):latest
DOCKER_REGISTRY := myregistry
K8S_DEPLOYMENT := k8s/deployment.yaml
K8S_SERVICE := k8s/service.yaml

# Default target
all: build test

# Build the application
build:
	@echo "Building the application..."
	./scripts/build.sh

# Run tests
test:
	@echo "Running tests..."
	./scripts/test.sh

# Static analysis
sast:
	@echo "Running SAST scan..."
	./scripts/sast_scan.sh

# Docker build and push
docker:
	@echo "Building Docker image..."
	./scripts/docker_build_push.sh

# Trivy scan
trivy:
	@echo "Running Trivy scan..."
	./scripts/trivy_scan.sh

# Deploy to Kubernetes
deploy:
	@echo "Deploying to Kubernetes..."
	kubectl apply -f $(K8S_DEPLOYMENT)
	kubectl apply -f $(K8S_SERVICE)

# Generate SBOM
sbom:
	@echo "Generating Software Bill of Materials..."
	./scripts/sbom_generate.sh

# Clean up
clean:
	@echo "Cleaning up..."
	# Add cleanup commands here

.PHONY: all build test sast docker trivy deploy sbom clean