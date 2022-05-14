# Input variable definitions

variable "aws_region" {
  description = "The AWS region to use to create resources."
  default     = "us-west-2"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "instance_type" {
  description = "instance type for ec2 instance"
  type        = string
  default     = "t2.micro" 
}

variable "key_name" {
  description = "key pair for ec2 instance"
  type        = string
  default     = "natimalm" 
}

variable "ami" {
  description = "ami for ec2 instance"
  type        = string
  default     = "ami-0ee8244746ec5d6d4" 
}

variable "ec2_name" {
  description = "name for ec2 instance"
  type        = string
  default     = "ec2_1" 
}