pipeline {
environment {
registry = "cdowni/coursework"
registryCredential = 'dockerhub_id'
dockerImage = ''
}
agent any
stages {
stage('Build image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
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
steps{
script {
    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            dockerImage.push("${env.BUILD_NUMBER}")
            dockerImage.push("latest")
}
}
}
}
