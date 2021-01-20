# ---------------------------------------------------------------------------------------------------
# version  1.9
# Library: https://github.com/Frankie116/my-library.git
# Creates a new ec2 instance
# ---------------------------------------------------------------------------------------------------

# req:
# 1a-vpc.tf             - module.my-vpc.private_subnets[count.index]
# 2c-ami-snapshot.tf    - aws_ami.my-ami-snapshot.id
# 4a-sg-server.tf       - [aws_security_group.my-sg-server1.id]
# variables.tf          - var.my-instances-per-subnet
# variables.tf          - var.my-instance-type
# variables.tf          - var.my-servername
# variables.tf          - var.my-project-name
# variables.tf          - var.my-environment


locals {
  jumpbox-count               = length(module.my-vpc.private_subnets)
}

resource "aws_instance" "my-jumpbox" {
  count                       = local.jumpbox-count
  ami                         = data.aws_ami.my-ami-amazon2.id
  instance_type               = var.my-instance-type
  subnet_id                   = module.my-vpc.public_subnets[count.index % length(module.my-vpc.public_subnets)]
  vpc_security_group_ids      = [aws_security_group.my-sg-jumpbox.id]
  key_name                    = var.my-private-key
  associate_public_ip_address = true
  tags = {
    Name                      = "my-jumpbox-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = var.my-environment
    Terraform                 = "true"
  }
}