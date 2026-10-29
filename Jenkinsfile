pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    environment {
        IMAGE_NAME = "aizhigitov-nursultan-student-api"
        IMAGE_TAG  = "v1.0-aizhigitov-nursultan"
        STUDENT    = "Aizhigitov Nursultan"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "=== [Checkout] Student: ${STUDENT} ==="
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "=== [Build] Compiling Spring Boot application for ${STUDENT} ==="
                sh './gradlew clean assemble -x test --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo "=== [Test] Running automated tests for ${STUDENT} ==="
                sh './gradlew test --no-daemon'
            }
        }

        stage('Docker Build') {
            steps {
                echo "=== [Docker Build] Building image ${IMAGE_NAME}:${IMAGE_TAG} ==="
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                echo "=== [Verify] Checking Docker image for ${STUDENT} ==="
                sh "docker images ${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} --format='Verified Image ID: {{.Id}}' && echo 'SUCCESS: Image verified for ${STUDENT}'"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for ${STUDENT}!"
        }
        failure {
            echo "Pipeline FAILED for ${STUDENT}. Execution stopped."
        }
    }
}
