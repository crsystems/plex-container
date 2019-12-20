pipeline {
        agent any 
        stages {
                stage('build') {
                        steps {
				sh 'curl -o plex.deb https://downloads.plex.tv/plex-media-server-new/1.18.3.2156-349e9837e/debian/plexmediaserver_1.18.3.2156-349e9837e_amd64.deb'
                                sh 'docker build -t crsystems/plex:test .'
                        }
                }
        }
}
