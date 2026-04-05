pipeline {
   agent any
   environment {
       TF_DIR = "test" // Directory for Terraform configuration
       TF_CLI_ARGS = "-no-color"   // Ensures clean, aligned output
   }
   stages {
       stage('Checkout - Code') {
           steps {
               git branch: 'develop', url: 'https://github.com/manojubale/deploy-ec2-using-tf-jenkins.git'
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