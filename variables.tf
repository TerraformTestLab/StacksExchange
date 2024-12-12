variable "project_name" {
  type        = string
  default = "stacks-exchange" # Replace with your desired project name
  description = "The name of the project"
}

variable "aws_region" {
  type        = string
  default = "ap-south-1" # Mumbai region # Replace with your desired region
  description = "AWS region to deploy the resources"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of CIDR blocks for public subnets"
}

variable "db_username" {
  type        = string
  sensitive   = true
  nullable    = false
  # default     = "some-great-user-name" # replace with your desired username
  description = "Username for the RDS instance"
}

variable "db_password" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "Password for the RDS instance"
  # default     = "some-higly-secure-password" # default password for the RDS instance, 
                                               # replace with your desired password, 
                                               # it has been commented out so that
                                               # you can provide the password securely
                                               # using a .tfvars file or environment variables
                                               # during terraform plan/apply
}

variable "key_name" {
  type        = string
  default     = "stacks-exchange-key"
  description = "Name of the SSH key pair to use for the EC2 instance"
}

variable "allowed_inbound_cidr_blocks" {
  type = list(string)
  description = "List of CIDR blocks to allow inbound traffic"
  # default     = ["xxx.xxx.xxx.xxx/32"] # replace xxx.xxx.xxx.xxx with your IP address
                                         # this is for SSH to EC2 bastion host from your system
                                         # to allow inbound traffic
                                         # to know your pulic IP address, you can try the following:
                                         # dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com
}  
