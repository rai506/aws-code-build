pipeline {
  agent {
    docker {
      image 'centos:7'
    }

  }
  stages {
    stage('build') {
      steps {
        sh '''echo "Build step"
'''
        sh 'echo "Build step 2"'
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
