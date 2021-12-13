provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "b6776cd673b1ef9a3ca32ca2a741f6d12722a01e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-13 09:16:16"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "106a88a8-14e9-4d03-8a35-8af26b011ec1"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "b6776cd673b1ef9a3ca32ca2a741f6d12722a01e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-13 09:16:16"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "505457f6-cb24-4be9-86e3-4c6d4beb4c1d"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
