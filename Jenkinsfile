pipeline {
    agent any
    
    environment {
        IMAGE_NAME = '654463037626.dkr.ecr.eu-west-2.amazonaws.com/aleksandra/my-backend-app'
        AWS_REGION = 'eu-west-2'
        ECR_URL = '654463037626.dkr.ecr.eu-west-2.amazonaws.com'
        IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Clone Repo') {
            steps {
                script {
                    echo 'Cloning...'
                }
                checkout scmGit(branches: [[name: '*/master']],
                extensions: [], 
                userRemoteConfigs: [[url: 'https://github.com/aleks11ik/cicdtest']])
            }    
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build') {
            steps {
                script {
                    echo 'Building..'
                    docker.build("${IMAGE_NAME}", './backend')
                }
            }
        }
        stage('ECRPush') {
            steps {
                echo 'ECR Push...'
                withAWS(credentials:'awscredentials', region:"${AWS_REGION}") {
                sh """
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${ECR_URL}
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                """
                }
            }
        }
        stage('Terraform init') {
            steps {
                dir('terraform') {
                    withAWS(credentials: 'awscredentials') {
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Terraform apply') {
            steps {
                dir('terraform') {
                    withAWS(credentials: 'awscredentials') {
                        sh 'terraform apply --auto-approve'
                    }
                }
            }
        }
        stage('frontend build') {
            steps {
                dir('frontend') {
                    sh 'npm ci'
                    sh 'npm run build'
                }
            }
        }
        stage ('upload frontend') {
            steps {
                withAWS(credentials:'awscredentials') {
                    sh 'aws s3 sync frontend/dist s3://aleksandra-frontend-bucket --delete'
                }
            }
        }
    }
}

// webhook-test-3!