pipeline {
agent any

    stages {
        stage('1.Cloning') {
            steps {
                git branch: 'staging', credentialsId: 'a103348d-dea8-483b-9868-b34560721c43', url: 'https://github.com/GroupGather/group-gather-be.git'
            }
        }

        stage('2.Updating') {
            steps {
                yarn 'install'
            }
        }

        stage('3.Building') {
            steps {
                yarn 'build'
            }
        }

        stage('4.Migrations') {
            steps {
                echo 'Not forget about DB migrations'
            }
        }

        stage('5.Archiving') {
            steps {
                sh 'tar -czvf app.tar.gz dist'
            }
        }

        stage('6.Deploying') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no app.tar.gz ubuntu@ip-172-31-28-152:/wildfly/wildfly-server/standalone/deployments'
            }
        }

    }

}
