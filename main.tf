provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "al2023" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["al2023-ami-2023.*-x86_64"]
    }
}

resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.al2023.id
    instance_type = "t2.micro"
    tags = {
        Name = "Abubakar's EC2 Instance"
    }
}

