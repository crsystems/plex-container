pipeline {
        agent any 
        stages {
                stage('build') {
			environment {
				DOCKER_LOGIN = credentials('docker-login')

			}
                        steps {
				sh 'curl -o plex.deb https://downloads.plex.tv/plex-media-server-new/$(cat .version)/debian/plexmediaserver_$(cat .version)_amd64.deb'
                                sh 'docker build --no-cache -t crsystems/plex:$(cat .version) .'
				sh 'docker build -t crsystems/plex:latest .'
				sh 'docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW'
				sh 'docker push crsystems/plex:$(cat .version)'
				sh 'docker push crsystems/plex:latest'
                        }
                }
        }
}
