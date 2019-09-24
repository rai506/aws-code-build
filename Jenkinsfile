pipeline {
  agent {
  	docker {
	    image '072976375213.dkr.ecr.ap-southeast-1.amazonaws.com/internal/terraform:alpine-3.10'
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
        sh 'terraform plan --detailed-exitcode -input=false || ([ "$?" -eq "2" ] && exit 0);'
      }
    }
    stage('deploy dev') {
      when {
        branch 'INTERNAL-*'
      }
      timeout(time: 1, unit: "DAYS" ) {
        input message: "Approve", submitter: 'admin'
      }
      steps {
        sh 'echo "Deploy dev"'
      }
    }

    stage('deploy prd') {
      when {
        branch 'master'
      }
      timeout(time: 1, unit: "DAYS" ) {
        input message: "Approve", submitter: 'admin'
      }
      steps {
        sh 'terraform apply -input=false -auto-approve'
      }
    }

  }
}
