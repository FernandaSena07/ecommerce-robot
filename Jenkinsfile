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
                    // Ativa o venv e executa os testes com listener do allure
                    bat '''
                        venv\\Scripts\\activate
                        robot --listener allure_robotframework output/allure tests
                    '''
                }
            }
        }
    }
    post {
        always {
            // Publica o relatório Allure no Jenkins
            allure([
                includeProperties: false,
                jdk: '',
                results: [[path: 'output/allure']],
                reportBuildPolicy: 'ALWAYS'
            ])
        }
    }
}
