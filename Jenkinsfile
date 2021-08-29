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
        container('helm'){
          script {
            sh '''
            PACKAGE=api-chart
	    cp -r /home/helm/.helm ~
            cd helm/${PACKAGE}
            helm package .
            git add ${PACKAGE}-*.tgz
            git commit -m "new package created"
            git push
	    '''
          }
        }
      }
    }
  }
}
