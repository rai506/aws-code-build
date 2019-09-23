pipeline {
  agent {
  	docker {
	image '072976375213.dkr.ecr.ap-southeast-1.amazonaws.com/internal/terraform:alpine-3.10'
    }
  }

    stages {

    stage('build') {
      steps {
        sh 'terraform init'
        sh 'terraform plan'
      }
    }
    stage('test') {
      steps {
        sh 'echo "Test step"'
      }
    }
    stage('deploy dev') {
      when {
        branch 'INTERNAL-*'
      }
      steps {
        sh 'echo "Deploy dev"'
      }
    }

    stage('deploy prd') {
      when {
        branch 'master'
      }
      steps {
        sh 'echo "Deploy prd"'
      }
    }

  }
}
