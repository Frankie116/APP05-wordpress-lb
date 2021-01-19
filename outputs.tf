

# output use-snapshot {
#   value       = var.use-snapshot
# }

output my-ssh-details {
  value       = "ssh bitnami@xxxxx -i ${var.my-private-key}.pem"
}

output instance-ids {
  description = "IDs of EC2 instances"
  value       = [aws_instance.my-server.*.public_ip]
}

