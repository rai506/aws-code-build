pipeline {
  agent any

    stages {

    stage('build') {
      steps {
        sh '''echo "Build step"
'''
        sh 'docker ps'
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
