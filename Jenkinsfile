pipeline {
   agent any

   environment {
       TF_DIR = "test"
       TF_CLI_ARGS = "-no-color"
       AWS_DEFAULT_REGION = 'us-east-2'
   }

   stages {

       stage('Checkout - Code') {
           steps {
               git branch: 'develop', url: 'https://github.com/manojubale/deploy-ec2-using-tf-jenkins.git'
           }
       }

       stage('Inject AWS Credentials') {
           steps {
               withCredentials([usernamePassword(
                   credentialsId: 'aws-creds',
                   usernameVariable: 'AWS_ACCESS_KEY_ID',
                   passwordVariable: 'AWS_SECRET_ACCESS_KEY'
               )]) {

                   sh 'aws sts get-caller-identity'

                   dir("${TF_DIR}") {
                       sh 'terraform init'
                       sh 'terraform plan'
                   }
               }
           }
       }
   }
}