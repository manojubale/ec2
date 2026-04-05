pipeline {
   agent any

   environment {
       TF_DIR = "test"
       TF_CLI_ARGS = "-no-color"

       AWS_ACCESS_KEY_ID = credentials('aws-access-key')
       AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
       AWS_REGION = 'us-east-2'
   }

   stages {

       stage('Checkout - Code') {
           steps {
               git branch: 'develop', url: 'https://github.com/manojubale/deploy-ec2-using-tf-jenkins.git'
           }
       }

       stage('Check AWS Access') {
           steps {
               sh 'aws sts get-caller-identity'
           }
       }

       stage('Terraform - Init') {
           steps {
               dir("${TF_DIR}") {
                   sh 'terraform init'
               }
           }
       }

       stage('Terraform - Validate') {
           steps {
               dir("${TF_DIR}") {
                   sh 'terraform validate'
               }
           }
       }

       stage('Terraform - Plan') {
           steps {
               dir("${TF_DIR}") {
                   sh 'terraform plan'
               }
           }
       }

       stage('Terraform Apply') {
           steps {
               dir("${TF_DIR}") {
                   sh 'terraform apply -auto-approve'
               }
           }
       }
   }
}