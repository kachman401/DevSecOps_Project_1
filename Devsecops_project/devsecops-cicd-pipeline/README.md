# DevSecOps CI/CD Pipeline

This project implements a complete DevSecOps CI/CD pipeline using Jenkins, GitHub Actions, SonarQube, Trivy, and Docker. The pipeline is designed to ensure secure code practices, automated testing, and seamless deployment.

## Project Structure

- **.github/workflows**: Contains GitHub Actions workflows for CI, CD, and SonarQube integration.
  - **ci.yml**: Defines the Continuous Integration workflow.
  - **cd.yml**: Defines the Continuous Deployment workflow.
  - **sonar.yml**: Integrates SonarQube analysis into the CI/CD pipeline.

- **jenkins**: Contains Jenkins pipeline definitions and shared libraries.
  - **Jenkinsfile**: Main Jenkins pipeline definition.
  - **shared-library**: Contains reusable pipeline functions.
    - **vars/pipeline.groovy**: Shared pipeline functions.
    - **src/org/example/Utils.groovy**: Utility functions for logging and error handling.

- **sonar**: Configuration for SonarQube analysis.
  - **sonar-project.properties**: SonarQube project settings.

- **trivy**: Security scanning configuration and scripts.
  - **trivy-policy.yaml**: Defines security policies for scanning.
  - **scan.sh**: Script to run the Trivy vulnerability scanner.

- **docker**: Docker configuration for building the application image.
  - **Dockerfile**: Instructions for building the Docker image.
  - **.dockerignore**: Files to ignore when building the Docker image.

- **k8s**: Kubernetes configuration files.
  - **deployment.yaml**: Deployment configuration.
  - **service.yaml**: Service configuration.
  - **namespace.yaml**: Namespace configuration.

- **scripts**: Contains various scripts for building, testing, and deploying the application.
  - **build.sh**: Builds the application.
  - **test.sh**: Runs unit tests.
  - **sast_scan.sh**: Performs Static Application Security Testing.
  - **sbom_generate.sh**: Generates a Software Bill of Materials.
  - **trivy_scan.sh**: Runs the Trivy scanner.
  - **docker_build_push.sh**: Builds and pushes the Docker image.
  - **deploy.sh**: Deploys the application.

- **src**: Source code for the application.
  - **app/main.go**: Main entry point of the Go application.
  - **tests/unit/test_main.go**: Unit tests for the application.

- **.gitignore**: Specifies files to ignore in Git.
- **Makefile**: Defines build commands and tasks.
- **docker-compose.yml**: Configuration for multi-container Docker environment.
- **README.md**: Documentation for the project.
- **LICENSE**: Licensing information for the project.

## Getting Started

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd devsecops-cicd-pipeline
   ```

2. **Set up Docker**:
   Ensure Docker is installed and running on your machine.

3. **Build the application**:
   Run the build script:
   ```
   ./scripts/build.sh
   ```

4. **Run tests**:
   Execute the test script:
   ```
   ./scripts/test.sh
   ```

5. **Scan for vulnerabilities**:
   Use Trivy to scan the application:
   ```
   ./trivy/scan.sh
   ```

6. **Deploy the application**:
   Deploy using the deployment script:
   ```
   ./scripts/deploy.sh
   ```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.