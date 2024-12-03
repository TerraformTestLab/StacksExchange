output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID of the newly created VPC"
}

output "ec2_ssh_ip" {
  value       = module.compute.ec2_public_ip
  description = "Public IP address of the EC2 instance for SSH access"
}

output "rds_endpoint" {
  value       = module.database.db_endpoint
  description = "Endpoint of the RDS instance"
}

output "ssh_connection_command" {
  value       = "ssh -i ~/.ssh/${var.key_name}.pem ec2-user@${module.compute.ec2_public_ip}"
  description = "SSH command to connect to the EC2 instance"
}

output "rds_instnace_identifier" {
  value       = "${var.project_name}-db-instance"
  description = "Identifier of the RDS instance"

}

output "psql_connection_command" {
  value       = "psql --host=${split(":", module.database.db_endpoint)[0]} --port=5432 --username=${var.db_username} --dbname=postgres"
  description = "psql command to connect to the RDS instance from the EC2 instance"
}