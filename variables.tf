#vpc variables

variable "firehawk_init_dependency" {
  description = "An output from another dependency can be used here to halt this module until it is complete"
  type        = string
  default     = null
}

variable "create_vpc" {
  description = "Defines if the VPC should be created.  Setting this to false when the VPC exists will destroy the VPC."
  type        = bool
  default     = true
}

variable "route_public_domain_name" {
  description = "Defines if a public DNS name is to be used"
  type        = bool
  default     = false
}

variable "private_domain" {
  description = "The private domain name to be used for hosts within the VPC.  It is recommended this is set to a domain you own to prevent attacks should DNS leak. eg: example.com"
  type        = string
  default     = "service.consul"
}

variable "sleep" {
  description = "Sleep will disable the nat gateway and shutdown instances to save cost during idle time."
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "NAT gateway allows outbound internet access for instances in the private subnets."
  type        = bool
  default     = true
}

variable "azs" {
  description = "A list of AWS Availability Zones to place new subnets within the VPC."
  type        = list(string)
  default     = null
}

variable "private_subnets" {
  description = "The list of private subnet CIDR blocks to place private instances within."
  type        = list(string)
  default     = ["10.4.1.0/24", "10.4.2.0/24"]
}

variable "public_subnets" {
  description = "The list of public subnet CIDR blocks to place public facing instances within."
  type        = list(string)
  default     = ["10.4.101.0/24", "10.4.102.0/24"]
}

variable "vpc_cidr" {
  description = "The CIDR block that contains all subnets within the VPC."
  type        = string
  default     = "10.4.0.0/16"
}

variable "vpn_cidr" {
  description = "The CIDR range that the vpn will assign to remote addresses within the vpc.  These are virtual DHCP addresses for routing traffic."
  type        = string
  default     = "172.19.232.0/24"
}

variable "remote_ip_cidr" {
  description = "The remote public address that will connect to the bastion instance and other public instances.  This is used to limit inbound access to public facing hosts like the VPN from your site's public IP."
  type        = string
  default     = null
}

variable "remote_ip_graphical_cidr" {
  description = "The remote public address that will connect to the graphical bastion instance and other public instances.  This is used to limit inbound access to public facing hosts like the VPN from your site's public IP."
  type        = string
  default     = null
}

variable "remote_subnet_cidr" {
  description = "The subnet CIDR Range of your onsite private subnet. This is also the subnet where your VPN client resides in. eg: 192.168.1.0/24"
  type        = string
  default     = null
}

variable "aws_key_name" {
  description = "The name of the AWS PEM key for access to the VPN instance"
  type        = string
  default     = null
}

variable "aws_private_key_path" {
  description = "The path to the AWS private PEM key for access to the VPN instance"
  type        = string
  default     = "~/.ssh/aws_key.pem"
}

locals { # if no key exists then private_key is blank
  private_key = fileexists(var.aws_private_key_path) ? file(var.aws_private_key_path) : ""
}

variable "route_zone_id" {
  description = "(Optional) The Route53 Zone ID if using a public DNS"
  type        = string
  default     = null
}

variable "public_domain_name" {
  description = "(Optional) The public domain if required for DNS names of hosts eg: vpn.example.com"
  type        = string
  default     = null
}

variable "cert_arn" {
  description = "(Optional) The certificate ARN for the public domain if using public DNS."
  type        = string
  default     = null
}

variable "create_vpn" {
  description = "Initialise openVPN.  If you dont require a VPN for the VPC this can be set to false."
  type = bool
  default = false
}

variable "openvpn_user" {
  description = "The openVPN user name to connect the client gateway."
  type        = string
  default     = "openvpnas"
}

variable "openvpn_user_pw" {
  description = "The openVPN user password"
  type        = string
  default     = null
}

variable "openvpn_admin_user" {
  description = "The openVPN admin user name to configure the client gateway."
  type        = string
  default     = "openvpnas"
}

variable "openvpn_admin_pw" {
  description = "The openVPN admin password"
  type        = string
  default     = null
}

variable "node_skip_update" {
  description = "Skipping node updates is not recommended, but it is available to speed up deployment tests when diagnosing problems"
  type        = bool
  default     = false
}

variable "vpc_name" {
  description = "The name to associate with the VPC"
  type        = string
  default     = "Main VPC"
}

variable "common_tags" {
  description = "A map of common tags to assign to the resources created by this module"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The AWS Region to create all resources in for this module."
  type        = string
  default     = null
}

variable "create_bastion" {
  description = "Optionally create a bastion resource for the VPC"
  type        = bool
  default     = false
}

variable "create_bastion_graphical" {
  description = "Optionally create a graphical bastion resource for the VPC"
  type        = bool
  default     = false
}

variable "bastion_ami_id" {
  description = "The prebuilt AMI for the bastion host. This should be a private ami you have build with packer."
  type = string
  default = null
}

variable "bastion_graphical_ami_id" {
  description = "The prebuilt AMI for the graphical bastion host. This should be a private ami you have build with packer."
  type = string
  default = null
}

variable "create_openvpn" {
  description = "Optionally disable the VPN resource for the VPC"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "The instance type to use for the VPN"
  type        = string
  default     = "t3.micro"
}
