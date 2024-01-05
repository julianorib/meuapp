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
                    dockerapp = docker.build("julianorib/meuapp:v1.0}", '-f Dockerfile .')
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker-Hub-Juliano') {
                    dockerapp.push('latest')
                    dockerapp.push('v1.0')
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