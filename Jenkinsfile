pipeline {

  agent {
  	docker {
	    image '${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com/internal/terraform:alpine-3.10'
      registryUrl 'https://${AWS_ACCOUNT_ID}.dkr.ecr.ap-southeast-1.amazonaws.com/'
    }
  }


    stages {

    stage('Build') {
      steps {
        build job: 'test'
      }
    }
    stage('Test') {
      steps {
        sh 'echo "Test"'
      }
    }

    stage('deploy dev') {
      when {
        branch 'INTERNAL-*'
      }
      steps {
        timeout(time: 1, unit: "DAYS" ) {
          input message: "Approve", submitter: 'admin'
        }
        sh 'echo "Deploy Dev"'
      }
    }

    stage('deploy prd') {
      when {
        branch 'INTERNAL-*'
      }

      steps {
        timeout(time: 1, unit: "DAYS" ) {
          input message: "Approve", submitter: 'admin'
        }
        sh 'echo "Deploy Production"'
      }
    }
   }
    post {
        always {
        mail to: 'pmquang1990@gmail.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Something is wrong with ${env.BUILD_URL} ${env.AWS_ACCOUNT_ID}"
    }}

}
