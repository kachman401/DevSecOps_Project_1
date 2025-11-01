def call(Map config) {
    pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                    checkout scm
                }
            }

            stage('Static Analysis') {
                steps {
                    script {
                        // Call SonarQube analysis
                        sonarQubeScan(config.sonarQube)
                    }
                }
            }

            stage('Build') {
                steps {
                    script {
                        // Build the application
                        sh './scripts/build.sh'
                    }
                }
            }

            stage('Test') {
                steps {
                    script {
                        // Run unit tests
                        sh './scripts/test.sh'
                    }
                }
            }

            stage('SAST Scan') {
                steps {
                    script {
                        // Perform SAST scan
                        sh './scripts/sast_scan.sh'
                    }
                }
            }

            stage('Docker Build & Push') {
                steps {
                    script {
                        // Build and push Docker image
                        sh './scripts/docker_build_push.sh'
                    }
                }
            }

            stage('Trivy Scan') {
                steps {
                    script {
                        // Run Trivy vulnerability scan
                        sh './scripts/trivy_scan.sh'
                    }
                }
            }

            stage('Deploy') {
                steps {
                    script {
                        // Deploy the application
                        sh './scripts/deploy.sh'
                    }
                }
            }
        }

        post {
            always {
                // Clean up actions
                cleanWs()
            }
        }
    }
}