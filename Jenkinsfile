pipeline {
    agent any
    
    stages {
        stage('Primeiro Stage') {
            steps {
                echo 'Execução da Pipeline com Jenkins'
            }
        }
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/julianorib/meuapp.git', branch: 'main'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    dockerapp = docker.build("julianorib/meuapp:${env.BUILD_ID}", '-f Dockerfile .')
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker-Hub-Juliano') {
                    dockerapp.push('latest')
                    dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
    }
}