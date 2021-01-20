

output my-ssh-details {
  value       = "ssh bitnami@xxxxx -i ${var.my-private-key}.pem"
}


output my-website-address {
  description          = "Full website addresss including port number"
  value                = [aws_route53_record.my-r53-record-server.*.fqdn]
}

output my-jumpbox-address {
  description          = "Full website addresss including port number"
  value                = [aws_route53_record.my-r53-record-jumpbox.*.fqdn]
}