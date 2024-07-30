terraform {
  backend "s3" {
    bucket = "mydevopsnewbucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}