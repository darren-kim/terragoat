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
    git_commit           = "693b8301f2cc91d4a0ea0d2f2a6e4705fb13bbab"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-12 12:54:37"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "c6649289-2d5c-4d3c-a996-6ab4cc0eea76"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "693b8301f2cc91d4a0ea0d2f2a6e4705fb13bbab"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-12 12:54:37"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "ad576730-f26e-4112-9aee-2565a7fd97cc"
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
