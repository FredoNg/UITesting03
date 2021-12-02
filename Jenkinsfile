pipeline {
	agent none
	stages {
		stage('Integration UI Test') {
			parallel {
				stage('Deploy') {
					agent any
					steps {
						sh 'chmod 777 ./jenkins/scripts/deploy.sh'
						sh 'chmod 777 ./jenkins/scripts/kill.sh'
						sh './jenkins/scripts/deploy.sh'
						input message: 'Finished using the web site? (Click "Proceed" to continue)'
						sh './jenkins/scripts/kill.sh'
					}
				}
				stage('Headless Browser Test') {
					agent {
						docker {
							image 'maven:3-alpine' 
							args '-v /root/.m2:/root/.m2' 
						}
					}
					steps {
						sh 'mvn -B -DskipTests clean package'
						sh 'mvn test'
					}
					post {
						always {
							junit 'target/surefire-reports/*.xml'
						}
					}
				}
				stage ('Checkout') {
					steps {
						git branch:'master', url: 'https://github.com/FredoNg/UITesting03.git'
					}
				}
				stage('Code Quality Check via SonarQube') {
					steps {
						script {
							def scannerHome = tool 'SonarQube';
								withSonarQubeEnv('SonarQube') {
									sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=Lab-Exercise-09 -Dsonar.sources=."
								}
							}
						}						
					post {
						always {
							recordIssues enabledForFailure: true, tool: sonarQube()
						}
					}
				}
			}
		}
	}
}