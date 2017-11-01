pipeline {
    agent any
    stages {
        stage('Build and Test') {
            steps {
                sh 'sudo umount -R /alpine/proc && sudo umount -R /alpine/sys && sudo umount -R /alpine/dev'
				sh 'sudo rm -rf /alpine'
                sh 'sudo alpine-chroot-install/alpine-chroot-install -m http://nl.alpinelinux.org/alpine'
                sh '(cd /alpine; sudo tar -cvf root.tar * --exclude proc --exclude sys --exclude root.tar)'
                sh 'sudo mv /alpine/root.tar . && sudo chown ec2-user:ec2-user root.tar'
                sh "docker build -t afalko/alpine:${env.BUILD_NUMBER} ."
            }
        }
        stage('Publish') {
		    environment { 
                DOCKER_PASSWORD = credentials('DOCKER_PASSWORD') 
            }
            steps {
			    sh 'docker login -u afalko -p '
                sh "docker push afalko/alpine:${env.BUILD_NUMER}"
            }
        }
        stage('Update Docker Images') {
            steps {
                sh 'echo run dockerfile-image-update'
            }
        }
    }
}
