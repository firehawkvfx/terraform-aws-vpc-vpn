variable "name" {
  default = "bastion_graphical"
}

variable "bastion_graphical_ami_id" {
  description = "The prebuilt AMI for the bastion host. This should be a private ami you have build with packer."
  type = string
  default = null
}

variable "create_vpc" {}

variable "create_vpn" {
  default = false
}

variable "vpc_id" {
}

variable "vpc_cidr" {
}

# remote_ip_cidr is the ip address of the remote host / user intending to connect over vpn. eg '197.125.62.53/32'
#example "125.254.24.255/32"
variable "vpn_cidr" {
}

variable "remote_ip_cidr" {
}

variable "remote_ip_graphical_cidr" {
}

variable "public_subnets_cidr_blocks" {
}

variable "route_public_domain_name" {}

variable "remote_subnet_cidr" {
}

variable "aws_private_key_path" {
}

# examples ["subnet-0a7554f56af4d6d0a", "subnet-0257c7f8b1d68b6e4"]
variable "public_subnet_ids" {
  default = []
}

variable "aws_key_name" {
}

#contents of the my_key.pem file to connect to the instance.
variable "private_key" {
}

variable "instance_type" {
  default = "g3s.xlarge"
}

variable "user" {
  default = "centos"
}

variable "sleep" {
  default = false
}

variable "skip_update" {
  default = false
}

