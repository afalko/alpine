pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'docker build -t afalko/alpine'
            }
        }
        stage('Publish') {
            steps {
                sh 'docker push afalko/alpine'
            }
        }
        stage('Update Docker Images') {
            steps {
                sh 'echo run dockerfile-image-update'
            }
        }
    }
}
