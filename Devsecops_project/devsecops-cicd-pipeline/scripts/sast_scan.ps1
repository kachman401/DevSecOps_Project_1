# ============================================
# SAST Scan Script for SonarQube (PowerShell)
# ============================================

Write-Host "Starting SAST scan with SonarQube..." -ForegroundColor Cyan

# Ensure the SONAR_TOKEN environment variable is set
if (-not $env:SONAR_TOKEN) {
    Write-Host "ERROR: SONAR_TOKEN environment variable is not set." -ForegroundColor Red
    exit 1
}

# Optional JVM memory settings (helps avoid scanner crashes)
$env:SONAR_SCANNER_OPTS = "-Xmx512m"

# Run the SonarScanner with correct project directory
sonar-scanner `
  -D"sonar.projectKey=my_project_key" `
  -D"sonar.projectName=my_project_name" `
  -D"sonar.host.url=http://localhost:9000" `
  -D"sonar.login=$env:SONAR_TOKEN" `
  -D"sonar.projectBaseDir=../src/app" `
  -D"sonar.sources=." `
  -D"sonar.sourceEncoding=UTF-8"

Write-Host "SAST scan completed." -ForegroundColor Green
