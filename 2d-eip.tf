

resource "aws_eip" "my-eip" {
  count                     = local.instance-count
  instance                  = aws_instance.my-server[count.index].id
  tags = {
    Name                      = "my-eip-0${count.index+1}" 
    Project                   = var.my-project-name
    Environment               = var.my-environment
    Terraform                 = "true"
  }
}