data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.10.20260302.1-kernel-6.1-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
