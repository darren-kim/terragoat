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
    git_commit           = "2d9909f21cb949a4385562ed39c168088e303b6e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-06 13:40:44"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "c8629e7a-45c9-45da-a372-544d5a5cb7cb"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "2d9909f21cb949a4385562ed39c168088e303b6e"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-06 13:40:44"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "5632d82d-ce7a-4535-8500-ca43eb594398"
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
