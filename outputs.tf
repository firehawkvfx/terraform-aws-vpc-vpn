output "vpc_id" {
  value = local.vpc_id
}

output "private_route53_zone_id" {
  value = local.private_route53_zone_id
}

output "vpc_cidr_block" {
  value = local.vpc_cidr_block
}

output "private_subnets" {
  depends_on = [ aws_subnet.private_subnet ]
  value = local.private_subnets
}

# output "private_subnets_cidr_blocks" {
#   depends_on = [ aws_subnet.private_subnet ]
#   value = local.private_subnets_cidr_blocks
# }

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "public_subnets" {
  depends_on = [ aws_subnet.public_subnet ]
  value = local.public_subnets
}

output "public_subnets_cidr_blocks" {
  depends_on = [ aws_subnet.public_subnet ]
  value = local.public_subnets_cidr_blocks
}

output "vpc_main_route_table_id" {
  value = local.vpc_main_route_table_id
}

output "public_route_table_ids" {
  value = local.public_route_table_ids
}

output "private_route_table_ids" {
  value = local.private_route_table_ids
}

output "vpn_private_ip" {
  value = module.vpn.private_ip
}

output "vpc_tags" {
  depends_on = [ aws_vpc.main, aws_subnet.private_subnet ]
  value = local.vpc_tags
}

output "subnet_names" {
  depends_on = [ aws_vpc.main, aws_subnet.private_subnet ]
  value = local.subnet_names
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "bastion_private_ip" {
  value = module.bastion.private_ip
}

output "bastion_graphical_public_ip" {
  value = module.bastion_graphical.public_ip
}

output "bastion_graphical_private_ip" {
  value = module.bastion_graphical.private_ip
}

output "consul_client_security_group" {
  value = module.consul_client_security_group.consul_client_sg_id
}