terraform {
  backend "s3" {
    bucket         = "training-test678"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
