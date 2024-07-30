#mys3-devops-one

terraform {
  backend "s3" {
    bucket = "mydevopsnewbucket"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}