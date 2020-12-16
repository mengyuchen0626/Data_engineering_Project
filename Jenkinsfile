pipeline{
  agent any
  stages {
    stage('Build app'){
      stage('Run Flask App'){
        steps{
          script{
            sh 'docker-compose up'
          }
        }
      }
    }
    stage('Testing'){
      steps{
        script{
          echo 'release-specific test'
        }
      }
    }
    stage('Docker images down'){
      steps{
        script{
          sh 'docker rm -f project_c'
          sh 'docker rmi -f project'
        }
      }
    }
    stage('Creating release branch'){
      steps{
        script{
          echo 'branch into release'
        }
      }
    }
    stage('Going live'){
      steps{
        script{
          echo 'Merge with main'
        }
      }
    }
  }  
}
