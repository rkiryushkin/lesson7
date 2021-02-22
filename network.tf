resource "aws_vpc" "lesson7-vpc" {
    cidr_block = "172.31.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    enable_classiclink = false
    instance_tenancy = "default" 
    
    tags = {
      "Name" = "lesson7-vpc"
    }
}

resource "aws_subnet" "lesson7-subnet-public" {
    vpc_id = aws_vpc.lesson7-vpc.id
    cidr_block = "172.31.0.0/20"
    map_public_ip_on_launch = true
    availability_zone = "eu-central-1a"

    tags = {
      "Name" = "lesson7-subnet-public"
    }
}

resource "aws_internet_gateway" "lesson7-igw" {
    vpc_id = aws_vpc.lesson7-vpc.id

    tags = {
      "Name" = "lesson7-igw"
    }
}

resource "aws_route_table" "lesson7-public-crt" {
    vpc_id = aws_vpc.lesson7-vpc.id
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = aws_internet_gateway.lesson7-igw.id
    }
    
    tags = {
        Name = "lesson7-public-crt"
    }
}

resource "aws_route_table_association" "lesson7-crta-public-subnet"{
    subnet_id = aws_subnet.lesson7-subnet-public.id
    route_table_id = aws_route_table.lesson7-public-crt.id
}

resource "aws_security_group" "lesson7-http-rdp-winrm" {
    vpc_id = aws_vpc.lesson7-vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
      "Name" = "lesson7-http-rdp-winrm"
    }
}