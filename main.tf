provider "aws" {
  region                  = var.aws_region
}


####################################################
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                   = var.ec2_name
  ami                    = var.ami 
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

####################################################
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

###################################################

resource "aws_security_group" "sg_jenkins" {
  name        = "sg_jenkins"
  description = "Security Group"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
}


