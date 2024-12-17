provider "aws" {
  region = "ap-south-1"
}

# VPC resource
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

# Subnet resource
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway resource
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}

# Create an S3 bucket for the Terraform state
resource "aws_s3_bucket" "state_bucket" {
  bucket = "training-test6785" 
  acl    = "private"

  tags = {
    Name = "Terraform State Bucket"
  }
}


#ec2-creation
resource "aws_instance" "example" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
