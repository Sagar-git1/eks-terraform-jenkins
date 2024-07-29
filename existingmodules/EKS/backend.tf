terraform {
  backend "s3" {
    bucket = "mys3-devops-one"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}