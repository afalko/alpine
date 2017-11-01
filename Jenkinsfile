pipeline {
    agent any
    stages {
        stage('Build and Test') {
            steps {
                sh 'sudo mount | grep alpine | awk \'{print $3}\' | sort -r | xargs -I umount'
                sh 'sudo alpine-chroot-install/alpine-chroot-install -m http://nl.alpinelinux.org/alpine'
                sh '(cd /alpine; sudo tar -cvf root.tar * --exclude proc --exclude sys --exclude root.tar)'
                sh 'sudo mv /alpine/root.tar . && sudo chown ec2-user:ec2-user root.tar'
                sh 'docker build -t afalko/alpine .'
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
