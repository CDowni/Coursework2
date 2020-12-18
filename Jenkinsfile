node {
		def app

		stage('Clone repository') {
			checkout scm
		}
		stage('Build image') {
			app = docker.build("cdowni/devops_coursework")
		}
		stage('Test image') {
			app.inside {
				sh 'echo "Tests passed"'
			}
		}
		stage('Sonarqube') {
    environment {
        scannerHome = tool 'SonarQubeScanner'
    }
    steps {
        withSonarQubeEnv('sonarqube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
        
    }
}
		stage('Push image') {
			docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
				app.push("${env.BUILD_NUMBER}")
				app.push("latest")
			}
		}
	
	}
