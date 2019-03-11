provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "terraform_vpc" {
   cidr_block       = "${var.vpc_cidr}"
   instance_tenancy = "default"

   tags = {
     Name = "main"
   }
}

resource "aws_subnet" "terraform_ingress_subnet_az_1" {
  vpc_id            = "${aws_vpc.terraform_vpc.id}"
  cidr_block        = "${var.ingress_subnet_az_1_CIDR}"
  availability zone ="us-west-2a"
  map_public_ip_on_launch = "true"

  tags = {
   Name = "Ingress Subnet 1"

  }

  depends_on = [
    "aws_vpc.terra_vpc"
   ]
  }

resource "aws_subnet" "terraform_ingress_subnet_az_2" {
  vpc_id           = "${aws_vpc.terraform_vpc.id}"
  cidr_block       = "${var.ingress_subnet_az_2_CDIR}"
  availability zone = "us-west-2b"
  map_public_ip_on_launch = "true"

  tags  =  {
    Name = "Ingress Subnet 2"
  }

  depends_on [
    "aws_vpc.terraform_vpc"
   ]
  }
   
    


