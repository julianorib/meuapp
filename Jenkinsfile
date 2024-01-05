pipeline {
    agent any
    
    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/julianorib/meuapp.git', branch: 'main'
            }
        }
        stage('Build Image') {
            steps {
                script {
                    dockerapp = docker.build("julianorib/meuapp:v1.8", '-f Dockerfile .')
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker-Hub-Juliano') {
                    dockerapp.push('latest')
                    dockerapp.push('v1.8')
                    }
                }
            }
        }
        stage('Deploy Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'kubernetes-hml']) {
                    sh 'kubectl apply -f . -R'
                }
            }
        }
    }
}