param(
    [string]$DOCKER_REGISTRY,
    [string]$DOCKER_USERNAME,
    [string]$DOCKER_PASSWORD,
    [string]$SONAR_TOKEN,
    [string]$K8S_NAMESPACE
)

 Write-Host "Setting up GitHub secrets..."


# Create Docker and SonarQube secrets using GitHub CLI
gh secret set DOCKER_REGISTRY --body "$DOCKER_REGISTRY"
gh secret set DOCKER_USERNAME --body "$DOCKER_USERNAME"
gh secret set DOCKER_PASSWORD --body "$DOCKER_PASSWORD"
gh secret set SONAR_TOKEN --body "$SONAR_TOKEN"
gh secret set K8S_NAMESPACE --body "$K8S_NAMESPACE"

 Write-Host "All secrets have been added successfully!"




