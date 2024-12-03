variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "db_endpoint" {
  type = string
}

variable "key_name" {
  type = string
}

variable "allowed_inbound_cidr_blocks" {
  type = list(string)
}

variable "allowed_vpc_cidr_blocks" {
  type = list(string)
}