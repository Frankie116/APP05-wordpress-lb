# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# outputs
# ---------------------------------------------------------------------------------------------------

# req:
# None


# 06b-route53-record-lb.tf ----------------------------------------------------------
output my-http-website-address {
  description  = "Full website addresss including port number"
  value        = " http://${aws_route53_record.my-r53-record-lb.fqdn}"
}

output my-https-website-address {
  description  = "Full website addresss including port number"
  value        = "https://${aws_route53_record.my-r53-record-lb.fqdn}"
}

output my-https-admin-address {
  description  = "Full website addresss including port number"
  value        = "  https://${aws_route53_record.my-r53-record-lb.fqdn}/wp-admin/"
}

output ssh-server-details {
  value        = " ssh bitnami@${aws_instance.my-server[0].private_ip}"
}



# 06d-route53-record-jumpbox.tf -----------------------------------------------------
output my-jumpbox-address {
  description  = "Full website addresss including port number"
  value        = [aws_route53_record.my-r53-record-jumpbox.*.fqdn]
}

output ssh-jumpbox-details {
  value        = "ssh -A ec2-user@my-jumpbox-01.${var.my-existing-r53-zone} -i ${var.my-private-key}.pem"
}