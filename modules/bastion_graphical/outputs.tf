output "private_ip" {
  value = local.private_ip
  depends_on = [
    null_resource.provision_bastion_graphical
  ]
}

output "public_ip" {
  value = local.public_ip
  depends_on = [
    null_resource.provision_bastion_graphical
  ]
}

output "bastion_graphical_dependency" {
  value = local.bastion_graphical_dependency
  depends_on = [
    null_resource.provision_bastion_graphical
  ]
}