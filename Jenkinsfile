pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/PragyaChauhan1401/practice_jenkins.git'
            }
        }

        stage('Build') {
            steps {
                echo 'No build step needed for HTML'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying HTML page...'
                // Move the HTML file to a directory served by a web server
                sh 'cp index.html /var/www/html/index.html' // For Apache
                // Or use Python's HTTP server
                // sh 'python3 -m http.server 8000 &'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check logs.'
        }
        always {
            echo 'Pipeline finished (success or fail).'
        }
    }
}
