pipeline{
    agent any
    environment{
        CONTAINER_NAME = "nestjs-app"
        IMAGE_NAME = "nestjs-image"
        EMAIL = "ujjwalsaini00@gmail.com"
        PORT ="3000"

    }
    stages{
        stage('Clone Repo'){
            steps{
                git branch: 'main', url: 'https://github.com/ujjwalsaini45/Github-Workflow-ubuntu-AWS-EC2-Docker-.git'

            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
           stage('Stop and Remove Container'){
            steps{
                sh '''
                     docker stop $CONTAINER_NAME || true
                     docker rm $CONTAINER_NAME || true
                '''
            }
        }
              stage('Docker Container Run'){
            steps{
                sh '''
                     docker run -d -p${PORT}:${PORT}
                     --NAME $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
                   stage('Send Email Notification'){
            steps{
               emailtext(
                subject:"NestJS App Deployment",
                body:"The NestJS app has been deployed successfully. http://localhost:${PORT}",
                to: "${EMAIL}"
               )
            }
        }
    }

}