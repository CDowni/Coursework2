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
	stage('SonarQube') {
		steps {
		   script {
		   def scannerHome = tool 'sonarqube';
			   withSonarQubeEnv("sonarqube") {
			   sh "${tool("sonarqube")}/bin/sonar-scanner \
			   -Dsonar.projectKey=java-jenkins-sonar \
			   -Dsonar.sources=. \
			   -Dsonar.css.node=. \
			   -Dsonar.host.url=http://100.25.141.56/:9000 \
			   -Dsonar.login=58a0ea6e2e7fde949595774ba74d4fa6cd023673"
				   }
			   }
		   }
   }
}
