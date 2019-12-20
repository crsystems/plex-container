pipeline {
        agent any 
        stages {
                stage('build') {
			environment {
				DOCKER_LOGIN = credentials('docker-login')

			}
                        steps {
				sh 'curl -o plex.deb https://downloads.plex.tv/plex-media-server-new/1.18.3.2156-349e9837e/debian/plexmediaserver_1.18.3.2156-349e9837e_amd64.deb'
                                sh 'docker build --no-cache -t crsystems/plex:1.18.3.2156 .'
				sh 'docker build -t crsystems/plex:latest .'
				sh 'docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW'
				sh 'docker push crsystems/plex:1.18.3.2156'
				sh 'docker push crsystems/plex:latest'
                        }
                }
        }
}
