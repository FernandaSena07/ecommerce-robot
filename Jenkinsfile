pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/FernandaSena07/ecommerce-robot.git'
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Ativa venv e roda testes Robot Framework
                    bat 'venv\\Scripts\\activate && robot --listener allure_robotframework --outputdir=output/allure tests'
                }
            }
        }
    }
    post {
        always {
            // Publica o relatório Allure
            allure([
                includeProperties: false,
                jdk: '',
                results: [[path: 'output/allure']],
                reportBuildPolicy: 'ALWAYS'
            ])
        }
    }
}
