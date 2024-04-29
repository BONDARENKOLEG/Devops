                sshagent(['469c3108-2cba-4987-a859-d370c042a63f']) {
                    sh '''
                    scp -o StrictHostKeyChecking=no  ./script.sh ubuntu@ec2-3-77-204-199.eu-central-1.compute.amazonaws.com:/tmp/
                    '''
                }
