pipeline{
    agent any
    
    stages{
        stage('Code'){
            steps{
                git url: 'https://github.com/abhizor/node-todo-cicd.git' ,branch: 'master'
            }
        }
        stage('Build'){
            steps{
                sh 'docker build . -t abhishar7225/node-todo-test:latest'
                sh 'whoami' 
            }
        }
        stage('Push'){
            steps{
                withCredentials([usernamePassword(credentialsId:'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser' )]){
                sh "docker login -u ${env.dockerHubUser } -p ${env.dockerHubPassword}"
                sh 'docker push abhishar7225/node-todo-test:latest'
            
                }
            }
        }
        stage('Test'){
            steps{
                echo "Testing the Github Code"
            }
        }
        stage('Deployment'){
            steps{
                sh 'docker-compose down && docker-compose up -d'
            }
        }
    }
}
