pipeline {
    agent any
    stages {
        stage('Build and Test') {
            steps {
                sh 'sudo umount -R /alpine/proc || exit 0'
                sh 'sudo umount -R /alpine/sys || exit 0'
                sh 'sudo umount -R /alpine/dev || exit 0'
                sh 'sudo umount -R /alpine/run || exit 0'
                sh 'sudo umount -R /alpine/home/ec2-user/workspace/* || exit 0'
                sh 'sudo find /alpine -maxdepth 1 -mindepth 1 -path /alpine/dev -prune -o -path /alpine/sys -prune -o -print0 | xargs -0 -i sudo rm -rf {}'
                sh 'sudo alpine-chroot-install/alpine-chroot-install -m http://nl.alpinelinux.org/alpine'
                sh '(cd /alpine; sudo tar -cvf root.tar * --exclude proc --exclude sys --exclude root.tar)'
                sh 'sudo mv /alpine/root.tar . && sudo chown ec2-user:ec2-user root.tar'
                sh "docker build -t afalko/alpine:${BUILD_ID} ."
            }
        }
        stage('Publish') {
            environment {
                DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
            }
            when {
                expression {
                    BRANCH_NAME == "master"
                }
            }
            steps {
                sh "docker login -u afalko -p ${DOCKER_PASSWORD}"
                sh "docker push afalko/alpine:${BUILD_ID}"
            }
        }
        stage('Update Docker Images') {
            when {
                expression {
                    BRANCH_NAME == "master"
                }
            }
            environment {
                git_api_url = 'https://api.github.com'
                git_api_token = credentials('DOCKERFILE_IMAGE_UPDATE_TOKEN')
                image_map_store = 'docker-tag-store-demo'
            }
            steps {
                sh "docker run --rm -e git_api_token -e git_api_url \
                    salesforce/dockerfile-image-update --org afalko \
                    parent afalko/alpine ${BUILD_ID} ${image_map_store}"
            }
        }
    }
}
