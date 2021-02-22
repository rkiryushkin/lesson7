resource "aws_instance" "windows-instance" {
    ami = "ami-09a53ec51d0027c28"
    instance_type = "t2.micro"

    subnet_id = aws_subnet.lesson7-subnet-public.id

    vpc_security_group_ids = [aws_security_group.lesson7-http-rdp-winrm.id]

    key_name = "Lesson6"

    tags = {
      "Name" = "windows-instance"
    }
}