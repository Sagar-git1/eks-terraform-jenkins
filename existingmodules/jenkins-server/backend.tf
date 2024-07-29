#mys3-devops-one

terraform {
  backend "s3" {
    bucket = "mys3-devops-one"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}