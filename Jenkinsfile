pipeline {
  agent any

  options {
    timeout(time: 30, unit: 'MINUTES')
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  environment {
    IMAGE_NAME     = 'abhizor/node-todo-cicd'
    IMAGE_TAG      = "${BUILD_NUMBER}"
    CONTAINER_NAME = 'node-todo-cicd'
  }

  parameters {
    choice(
      name: 'DEPLOY_ENV',
      choices: ['staging', 'production'],
      description: 'Select the environment to deploy'
    )
  }
   
 stages{
    stage("Clone Repository"){
        steps{
           sh "git url: https://github.com/abhizor/node-todo-cicd.git", branch: "master"
        }
    }
    stage("Install Dependencies"){
      steps{
        sh "npm ci"
      }
    }
    stage("Lint+Test"){
        parallel{
            stage("Lint"){
                steps{
                    sh "npm run lint || true "
                }
            }
            stage("Test"){
               steps{
                sh "npm test || true"
               }
            }

        }
    }
    stage("Build Docker Image"){
        steps{
            sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ." 
        }
    }
    stage("Security Scan"){
        when{
            changeRequest()
            }
        steps{
            sh """
            echo "Scanning PR #${CHANGE_ID} by ${CHANGE_AUTHOR}"
            sh "docker run --rm aquasec/trivy image ${IMAGE_NAME}:${IMAGE_TAG}"
            """
        }

    }
    stage("Push Docker Image"){
        when{
            allOf{
                branch "master"
                not { changeRequest() }
            }
        }
        steps{
            sh """
            withCredentials([usernamePassword( 
            credentialsId: "dockerhub",
            usernameVariable: "DOCKER_USERNAME",
            passwordVariable: "DOCKER_PASSWORD"
            )]){
            echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
            docker push ${IMAGE_NAME}:${IMAGE_TAG}
            }
            """
        }

    }
    stage("Approval"){
        when{
            allof{
                branch "master"
                not {changeRequest()}
            }
        }
        steps{
            input messages: "Deploy to production?", ok: "Deploy"
        }
    }
    stage("Deploy"){
        when{
            allOf{
                branch "master"
                not { changeRequest() }
            }
        }
        steps{
             sh """
          docker stop ${CONTAINER_NAME}  || true
          docker rm   ${CONTAINER_NAME}  || true
          docker run -d \\
            --name ${CONTAINER_NAME} \\
            -p 8000:8000 \\
            ${IMAGE_NAME}:${IMAGE_TAG}
        """
        }
    }
 }
  post {
    always {
      sh 'docker image prune -f'
      cleanWs()
    }
    success { echo "✅ Build #${IMAGE_TAG} passed on ${BRANCH_NAME}" }
    failure { echo "❌ Build #${IMAGE_TAG} failed on ${BRANCH_NAME}" }
  }

}
