pipeline {
    agent any

    environment {
        DOCKER_USERNAME = 'manindersinghdhote'    // Docker Hub username
        DOCKER_IMAGE = 'htmlapp'                  // Docker image name
        DOCKER_TAG = 'latest'                      // Docker tag
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
                    // sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                    sh 'docker build -t ${DOCKER_USERNAME}/${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Push Docker Image') {
    steps {
        script {
                    // Authenticate with Docker Hub using credentials stored in Jenkins
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-creds') {
                        // Tag the image using variables for username and image
                       // sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_USERNAME}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                        // Push the image to Docker Hub using variables
                        sh "docker push ${DOCKER_USERNAME}/${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }
    }
}


        stage('Clean Up') {
            steps {
                script {
                    // Remove local Docker images to save space
                    sh 'docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }
    }
}
