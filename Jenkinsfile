pipeline {
        agent any 
        stages {
                stage('build') {
			environment {
				DOCKER_LOGIN = credentials('docker-login')

			}
                        steps {
				sh 'PLEX_VERSION=$(cat .version)'
				sh 'curl -o plex.deb https://downloads.plex.tv/plex-media-server-new/$PLEX_VERSION/debian/plexmediaserver_$PLEX_VERSION_amd64.deb'
                                sh 'docker build --no-cache -t crsystems/plex:$PLEX_VERSION .'
				sh 'docker build -t crsystems/plex:latest .'
				sh 'docker login -u $DOCKER_LOGIN_USR -p $DOCKER_LOGIN_PSW'
				sh 'docker push crsystems/plex:$PLEX_VERSION'
				sh 'docker push crsystems/plex:latest'
                        }
                }
        }
}
