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
        sh 'cho "Test step"'
      }
    }
    stage('deploy') {
      steps {
        sh 'echo "Deploy step"'
      }
    }
  }
}