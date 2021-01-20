# ---------------------------------------------------------------------------------------------------
# version  1.8
# Library: https://github.com/Frankie116/my-library.git
# Purpose: Create a new route53 record in an existing route53 hosted zone
#          DNS record is NOT loadbalnced.  Use 06a-route53.tf if loadbalancing required.    
# ---------------------------------------------------------------------------------------------------

# req:
# 3a-eip.tf:  [data.aws_eip.my-eip.public_ip]

data "aws_route53_zone" "my-r53zone" {
  name            = var.my-existing-r53-zone
}

