pipeline {
    agent {label 'aws'}

    stages {
        stage('preparation') {
            steps {
            git 'https://github.com/radwanabil/Booster_CI_CD_Project.git'
            }

        }
        
        
         stage('docker build') {
              steps {
                  withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker build . -f dockerfile -t radwa98/sprints_jenkins_django:latest
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker push radwa98/sprints_jenkins_django:latest
                """

            }
            }
            }
          stage('docker push') {
              steps {
                  withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker push radwa98/sprints_jenkins_django:latest
                """

            }
               }
         }
            stage('docker deploy') {
              steps {
            
              sh 'docker run -d -p 20:8080 radwa98/sprints_jenkins_django:latest'
            }
            
        }
     }

           post{
               success{
                  slackSend(color: '', "Pipline succeeded")
               
               }
                failure{
                  slackSend(color: '', "Pipline failed")
               
               }
           
          }
   }
