locals {
  extra_tags = { 
    role  = "consul_client"
    route = "public"
  }
  name = "consul_client"
}

variable "create_vpc" {
    type = bool
}

variable "remote_ip_cidr_list" {
    type = list(string)
}

variable "vpc_id" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "common_tags" {
  description = "A map of common tags to assign to the resources created by this module"
  type        = map(string)
  default     = {}
}

output "consul_client_sg_id" {
    value = element( concat( aws_security_group.consul_client.*.id, list("") ), 0 )
}

resource "aws_security_group" "consul_client" {
  count       = var.create_vpc ? 1 : 0
  name        = local.name
  vpc_id      = var.vpc_id
  description = "Consul Client Security Group"

  tags = merge(map("Name", format("%s", local.name)), var.common_tags, local.extra_tags)

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [var.vpc_cidr]
    description = "all incoming traffic from vpc"
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = var.remote_ip_cidr_list
    description = "ssh"
  }

#   ingress {
#     protocol    = "icmp"
#     from_port   = 8
#     to_port     = 0
#     cidr_blocks = [var.remote_ip_cidr, var.remote_ip_graphical_cidr]
#     description = "icmp"
#   }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "all outgoing traffic"
  }
}