pipeline{
  agent any
  stages {
    stage('Build Flask app'){
      steps{
        script{
          if(env.BRANCH_NAME == 'Develop' || env.BRANCH_NAME == 'release'){
            sh 'docker build -t project .'
          }
        }      
      }
    }
    stage('Run docker images'){
      parallel{
        stage('Run Flask App'){
          steps{
            script{
              if(env.BRANCH_NAME == 'Develop' || env.BRANCH_NAME == 'release'){
                sh 'docker-compose up'
              }  
            }
          }
        }
      }
    }
    stage('Testing'){
      steps{
        script{
          if(env.BRANCH_NAME == 'Develop'){
            sh 'python test.py'
          }
          else if(env.BRANCH_NAME == 'release'){
            echo 'release-specific test'
          }
        }
      }
    }
    stage('Docker images down'){
      steps{
        script{
          if(env.BRANCH_NAME == 'Develop'){
            sh 'docker rm -f project_c'
            sh 'docker rmi -f project'
          }
        }
      }
    }
    stage('Creating release branch'){
      steps{
        script{
          if(env.BRANCH_NAME == 'Develop'){
            echo 'branch into release'
          }
        }
      }
    }
  }  
}
