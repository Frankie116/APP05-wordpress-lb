

output my-ssh-details {
  value       = "ssh bitnami@xxxxx -i ${var.my-private-key}.pem"
}


output my-website-address {
  description          = "Full website addresss including port number"
  value                = [aws_route53_record.my-r53-record.*.fqdn]
}
