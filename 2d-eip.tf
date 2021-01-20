

# resource "aws_eip" "my-eip" {
#   count                     = local.instance-count
#   instance                  = aws_instance.my-server[count.index].id
#   tags = {
#     Name                      = "my-eip-0${count.index+1}" 
#     Project                   = var.my-project-name
#     Environment               = var.my-environment
#     Terraform                 = "true"
#   }
# }

data "aws_eip" "my-eip-01" {
  tags = {
    Name = "my-eip-01" 
  }
}


data "aws_eip" "my-eip-02" {
  tags = {
    Name = "my-eip-02"
  }
}


resource "aws_eip_association" "eip_assoc-01" {
  instance_id   = aws_instance.my-server[0].id
  allocation_id = data.aws_eip.my-eip-01.id
}


resource "aws_eip_association" "eip_assoc-02" {
  instance_id   = aws_instance.my-server[1].id
  allocation_id = data.aws_eip.my-eip-02.id
}