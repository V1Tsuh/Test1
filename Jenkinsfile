pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build and Publish') {
            steps {
                script {
                    // Сборка и публикация проекта .NET Core
                    bat 'dotnet restore'
                    bat 'dotnet build -c Release'
                    bat 'dotnet publish -c Release -o ./publish'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Сборка Docker образа
                    docker.build("my-docker-image:latest", "-f Dockerfile.linux .")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Пуш Docker образа в ваш репозиторий
                    docker.withRegistry('https://registry.example.com', 'docker-credentials') {
                        docker.image("my-docker-image:latest").push()
                    }
                }
            }
        }
    }
}