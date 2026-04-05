resource "aws_instance" "my_ec2" {
  ami           = "ami-02f986bab3de34d0d"  # Amazon Linux 2 (us-east-2)
  instance_type = "t3.micro"
  user_data = file("userdata.sh")

  tags = {
    Name = "MyTerraformEC2"
  }
}