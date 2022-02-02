# create an IGW (Internet Gateway)
# It enables your vpc to connect to the internet

resource "aws_internet_gateway" "prod1-igw"{
    vpc_id = "${aws_vpc.prod1-vpc.id}"

    tags ={
        Name = "prod1-igw"
    }
}



# create a custom route table for public subnets
# public subnets can reach to the internet buy using this

resource "aws_route_table" "prod1-public-crt" {
    vpc_id = "${aws_vpc.prod1-vpc.id}"
    route{
        cidr_block = "0.0.0.0/0" //associated subnet can reach everywhere
        gateway_id = "${aws_internet_gateway.prod1-igw.id}"     //CRT uses this IGW to reach internet
    }

    tags = {
        Name = "prod-public-crt"
    }
}



# route table association for the public subnets
resource "aws_route_table_association" "prod1-crta-public-subnet-1" {
    subnet_id = "${aws_subnet.prod1-subnet-public1.id}"
    route_table_id = "${aws_route_table.prod1-public-crt.id}"
}


# security group
resource "aws_security_group" "ssh-allowed" {

    vpc_id = "${aws_vpc.prod1-vpc.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production. Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }

    //If you do not add this rule, you can not reach the NGIX
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags ={
        Name = "ssh-allowed"
    }
}