terraform {
  backend "s3" {
    bucket  = "manoj-terraform-state-bucket-01042026"   # must be unique
    key     = "ec2-prod/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}