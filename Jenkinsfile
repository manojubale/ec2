pipeline {
    agent any

    environment {
        TF_DIR = "prod"
        TF_CLI_ARGS = "-no-color"
        AWS_DEFAULT_REGION = "us-east-2"
    }

    stages {

        stage('Checkout - Code') {
            steps {
                git branch: 'main', url: 'https://github.com/manojubale/ec2.git'
            }
        }

        stage('Terraform Pipeline') {
            steps {

                withCredentials([
                    string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {

                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

                    echo "=== DEBUG AWS ==="
                    aws sts get-caller-identity

                    cd ${TF_DIR}

                    terraform init -migrate-state -force-copy
                    terraform validate
                    terraform plan
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}