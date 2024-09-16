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
    git_commit           = "e4abc403e7531aa259b9b382e489eee6991969de"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-07 01:37:04"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "e3ed5a0c-0dcc-4bb9-b54a-0c02bac2e524"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "e4abc403e7531aa259b9b382e489eee6991969de"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-12-07 01:37:04"
    git_last_modified_by = "70904073+darren-kim@users.noreply.github.com"
    git_modifiers        = "70904073+darren-kim"
    git_org              = "darren-kim"
    git_repo             = "terragoat"
    yor_trace            = "ab031668-b819-492f-8de4-efd15e953f2f"
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
