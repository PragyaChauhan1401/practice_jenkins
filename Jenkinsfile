pipeline {
    agent any

    environment {
        IMAGE_NAME = 'product-ci-app'
        CONTAINER_PORT = '80'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/PragyaChauhan1401/practice_jenkins.git'
            }
        }

        

        stage('Docker Build') {
            steps {
                bat "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Deploy') {
            
            steps {
                bat """
                    docker stop $IMAGE_NAME || true
                    docker rm $IMAGE_NAME || true
                    docker run -d -p 80:80 --name $IMAGE_NAME $IMAGE_NAME
                """
            }
        }
    }

    post {
        always {
            echo "Pipeline finished successfully."
        }
    }
}
