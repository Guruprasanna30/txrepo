pipeline {

  options {
    ansiColor('xterm')
  }

  agent {
    kubernetes {
      yamlFile 'builder.yaml'
    }
  }

  stages {

    stage('Kaniko Build & Push Image') {
      steps {
        container('kaniko') {
          script {
            sh '''
            /kaniko/executor --dockerfile `pwd`/dockerfile \
                             --context `pwd` \
                             --destination=guruprasanna30/jenkins:${BUILD_NUMBER}
            '''
          }
        }
      }
    }

    stage('Deploy App to Kubernetes with helm') {     
      steps {
        sh '''
          echo "hello world" 
        '''
      }
    }
  }
}