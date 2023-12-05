terraform {

 backend "s3" {
    bucket         = "mydemo12"
    key            = "terraform/terra1.state"
    region         = "us-east-1"
  }

}
provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "amazon-server" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  tags = {
    Name = "demo-server"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "mydemo12"
    Environment = "Dev"
  }
}