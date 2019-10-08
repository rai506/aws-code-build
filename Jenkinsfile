pipeline {

  environment {
    AWS_ACCOUNT_ID = credentials('aws-account-id')
  }

  agent {
  	docker {
	    image '276493936417.dkr.ecr.ap-southeast-1.amazonaws.com/internal/terraform:alpine-3.10'
    }
  }


    stages {

    stage('Build') {
      steps {
        sh 'terraform init -input=false'
      }
    }
    stage('Test') {
      steps {
        sh 'terraform plan --detailed-exitcode -input=false -no-color|| ([ "$?" -eq "2" ] && exit 0);'
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
        sh 'echo "Deploy dev"'
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
        sh 'terraform apply -input=false -auto-approve'
      }
    }
   }
    post {
        failure {
        mail to: 'pmquang1990@gmail.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Something is wrong with ${env.BUILD_URL} ${env.AWS_ACCOUNT_ID}"
    }}

}
