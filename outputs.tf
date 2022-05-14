# Output variable definitions
output "ec2_instance_public_ips" {
  description = "Public IP addresses of EC2 instance"
  value       = module.ec2_instance.public_ip
}
