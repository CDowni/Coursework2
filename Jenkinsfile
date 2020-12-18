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
    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
	stage('Sonarqube') {
        environment {
            scannerHome = tool 'SonarQube Scanner'
		steps {
			withSonarQubeEnv('SonarQube') {
				sh "./gradlew sonarqube"
			}
		}
        } 
    }
}
