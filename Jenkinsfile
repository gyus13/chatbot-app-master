pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = "gyus13"
        APP_NAME = "chatbotapp"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
    }

    stages {

        stage('Clean Workspace'){
            steps {
                script {
                    cleanWs()
                }
            }
        }

        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Test'){
            steps {
              sh 'node -v'
              sh 'npm prune'
              sh 'npm install'
              sh 'npm test'
            }

       }

        stage('Build Docker Image') {
            steps {
                script {
                    docker_image = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'docker-hub') {
                        docker_image.push("${env.BUILD_NUMBER}")
                        docker_image.push("latest")
                    }
                }
            }
        }
    }
}