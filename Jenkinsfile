pipeline {
  agent { label 'docker' }

  // tiempo maximo que puede durar el job, si sobrepasa este tiempo falla
  options {
    timeout(time: 2, unit: 'MINUTES')
  }

  // variable donde pongo el nombre de la imagen en una variable
  environment {
    ARTIFACT_ID = "elkin5/test-webapp:${env.BUILD_NUMBER}"
  }

  stages {
    stage('Build') {
      steps {
        script {
          dir("webapp") {
            dockerImage = docker.build "${env.ARTIFACT_ID}"
          }
        }
      }
    }
    stage('Run tests') {
      steps {
        sh "docker run ${dockerImage.id} npm test"
      }
    }
  }
}

