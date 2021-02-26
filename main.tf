provider "aws" {}


variable "subnet_cidr_block"{
    description = "subnet cidr block"
}

variable "vpc_cidr_block" {
    description = "vpc cidr block"
}

variable avail_zone {}

variable "environment" {
    description = "develoyment environment"
}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.vpc_cidr_block
tags = {
       Name: var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
tags = {
    Name: "subnet-1-dev"
 }
}


output "aws-vpc" {
    value = aws_vpc.development-vpc.id
}

output "dev-subnet-1" {
    value = aws_subnet.dev-subnet-1.id
}


