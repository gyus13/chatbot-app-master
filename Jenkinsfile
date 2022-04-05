pipeline {
    // 스테이지 별로 다른 거
    agent any

    triggers {
                pollSCM('*/3 * * * *')
            }

    stages {
        // 레포지토리를 다운로드 받음
        stage('Prepare') {
            agent any
            
            
            
            steps {
                echo 'Clonning Repository'

                git url: 'https://github.com/gyus13/chatbot-app-master.git',
                    branch: 'master'
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    echo 'Successfully Cloned Repository'
                }

                always {
                  echo "i tried..."
                }

                cleanup {
                  echo "after all other post condition"
                }
            }
        }
        
        // stage('Lint Backend') {
        //     // Docker plugin and Docker Pipeline 두개를 깔아야 사용가능!
        //     agent {
        //       docker {
        //         image 'node:10'
        //       }
        //     }

        //     steps {
        //       dir ('./'){
        //           sh '''
        //           npm install&&
        //           npm run lint
        //           '''
        //       }
        //     }
        // }

        // stage('Test Backend') {
        //   agent {
        //     docker {
        //       image 'node:10'
        //     }
        //   }
        //   steps {
        //     echo 'Test Backend'

        //     dir ('./'){
        //         sh '''
        //         npm install
        //         npm run test
        //         '''
        //     }
        //   }
        // }
        
        stage('Bulid Backend') {
          agent any
          steps {
            echo 'Build Backend'

            dir ('./'){
                sh """
                docker image build -t gyus13/chatbot:latest .
                """
            }
          }

          post {
            failure {
              error 'This pipeline stops here...'
            }
          }
        }
        
        // stage('Deploy Backend') {
        //   agent any

        //   steps {
        //     echo 'Build Backend'

        //     dir ('./server'){
        //         sh '''
        //         docker rm -f $(docker ps -aq)
        //         docker run -p 80:80 -d server
        //         '''
        //     }
        //   }

        //   post {
        //     success {
        //       mail  to: 'frontalnh@gmail.com',
        //             subject: "Deploy Success",
        //             body: "Successfully deployed!"
                  
        //     }
        //   }
        // }
    }
}
