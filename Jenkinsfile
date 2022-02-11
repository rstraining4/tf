pipeline {
    agent any

    stages {
        stage('GitHub Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rstraining4/tf.git']]])
            }
        }
        stage('Docker Commands') {
            steps {
                sh '''aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 398250248933.dkr.ecr.ap-south-1.amazonaws.com/myrepo
                        docker build -t node-app .
                        docker tag node-app:latest 398250248933.dkr.ecr.ap-south-1.amazonaws.com/myrepo
                        docker push 398250248933.dkr.ecr.ap-south-1.amazonaws.com/myrepo'''
            }
        }
        stage('terraform init') {
            steps {
                sh ('terraform init')
            }
        }
        stage('terraform action') {
            steps {
               echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve')
            }
        }
    }
}
