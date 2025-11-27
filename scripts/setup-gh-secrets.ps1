# This PowerShell script performs Static Application Security Testing (SAST) using SonarQube Scanner

# Define the path to the sonar-scanner.bat executable
$scannerPath = "C:\sonar-scanner-cli-7.3.0.5189-windows-x64\sonar-scanner-7.3.0.5189-windows-x64\bin\sonar-scanner.bat"

# Define the source directory and other parameters
$sourceDir = "C:\Users\USER\Desktop\Devoscops\Devsecops_project\devsecops-cicd-pipeline\src\app"
$projectKey = "my_project_key"
$sonarHost = "http://localhost:9000"
$sonarToken = "772dc48cdf7d1b62da5457cb47c237740662e8cb"   # replace with your actual token

# Run SonarQube scan
Write-Host "🔍 Starting SAST scan with SonarQube..." -ForegroundColor Cyan

$process = Start-Process -FilePath $scannerPath `
    -ArgumentList "-Dsonar.projectKey=$projectKey",
                  "-Dsonar.sources=$sourceDir",
                  "-Dsonar.host.url=$sonarHost",
                  "-Dsonar.login=$sonarToken" `
    -NoNewWindow -Wait -PassThru

# Check if the scan succeeded
if ($process.ExitCode -ne 0) {
    Write-Host "❌ SAST scan failed." -ForegroundColor Red
    exit 1
} else {
    Write-Host "✅ SAST scan completed successfully." -ForegroundColor Green
}
