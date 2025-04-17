pipeline {
    agent any

    environment {
        IMAGE_NAME = 'product-ci-app'
        CONTAINER_PORT = '82'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/PragyaChauhan1401/practice_jenkins.git'
            }
        }

        stage('Build Code') {
            steps {
                echo "Building code from ${env.BRANCH_NAME}"
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Deploy (only on master)') {
            when {
                branch 'master'
            }
            steps {
                sh """
                    docker stop $IMAGE_NAME || true
                    docker rm $IMAGE_NAME || true
                    docker run -d -p 82:82 --name $IMAGE_NAME $IMAGE_NAME
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline finished for ${env.BRANCH_NAME}"
        }
    }
}
