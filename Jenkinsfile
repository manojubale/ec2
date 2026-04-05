pipeline {
   agent any

   environment {
       TF_DIR = "test"
       TF_CLI_ARGS = "-no-color"
       AWS_DEFAULT_REGION = 'us-east-1'
   }

   stages {

       stage('Checkout - Code') {
           steps {
               git branch: 'develop', url: 'https://github.com/manojubale/deploy-ec2-using-tf-jenkins.git'
           }
       }

       stage('Terraform Pipeline') {
           steps {

               withCredentials([usernamePassword(
                   credentialsId: 'aws-creds',
                   usernameVariable: 'AWS_ACCESS_KEY_ID',
                   passwordVariable: 'AWS_SECRET_ACCESS_KEY'
               )]) {

                   sh '''
                   export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                   export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                   export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

                   echo "=== DEBUG AWS ==="
                   aws sts get-caller-identity

                   cd ${TF_DIR}

                   terraform init
                   terraform validate
                   terraform plan
                   terraform apply -auto-approve
                   '''
               }
           }
       }
   }
}
