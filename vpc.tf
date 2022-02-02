resource "aws_vpc" "prod1-vpc"{
    cidr_block = "10.0.0.0/16"
    enable_dns_support =  "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags ={
        Name = "prod1-vpc"
    }
}


resource "aws_subnet" "prod1-subnet-public1" {
    vpc_id = "${aws_vpc.prod1-vpc.id}"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"  //It make this is a public subnet
    availability_zone = "us-east-1a"

    tags= {
        Name = "prod1-subnet-public1"
    }
}