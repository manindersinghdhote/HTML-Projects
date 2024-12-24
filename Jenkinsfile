pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "html-app:latest"
    }

    stages {
        stage('Checkout Code') 
        {
            steps {
                // Pull the code from a Git repository
                git 'https://github.com/manindersinghdhote/HTML-Projects.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                                    // Authenticate with Docker Hub (or your private registry)
                   docker.withRegistry('https://registry.hub.docker.com', 'docker-creds') {
            app.push("latest")
                    
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Remove local Docker images to save space
                    sh 'docker rmi ${DOCKER_IMAGE}'
                }
            }
        }
    }
}
