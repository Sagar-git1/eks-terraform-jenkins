
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-jen-vpc"
  cidr = var.jen-vpc-cidr

  azs             = data.aws_availability_zones.azs.names
  public_subnets  = ["10.0.0.0/24"]

  enable_dns_support = true
  enable_dns_hostnames = true
  map_public_ip_on_launch = true

  tags = {
    Name = "my-jen-vpc"
  }
  public_subnet_tags = {
    Name = "my-jen-subnet"
  }
}


module "sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jenkins-sg"
  description = "Security Group for Jenkins Server"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

  tags = {
    Name = "jenkins-sg"
  }
}



module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-instance"

  instance_type          = var.instance_type
  key_name               = "newkeyone"
  monitoring             = true
  vpc_security_group_ids = [module.sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  availability_zone = data.aws_availability_zones.azs.names[0]
  user_data = file("jenkinsinstall.sh")
  tags = {
    Name = "jenkins-server"
    Terraform   = "true"
    Environment = "dev"
  }
}

