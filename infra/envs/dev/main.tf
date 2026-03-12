terraform {
  required_version = ">= 1.6"

  required_providers {
    # Volcengine Terraform provider
    # Registry: https://registry.terraform.io/providers/volcengine/volcengine/latest
    volcengine = {
      source  = "volcengine/volcengine"
      version = "~> 0.0.192"
    }
  }
}

# -------------------------------------------------------------------
# Module: tags
# Outputs a standard tag map for all resources in this environment.
# -------------------------------------------------------------------
module "tags" {
  source = "../../modules/tags"

  env    = var.env
  region = var.region
  repo   = var.repo
}

# -------------------------------------------------------------------
# Module: naming
# Outputs a name_prefix (e.g. "dev-") for consistent resource naming.
# -------------------------------------------------------------------
module "naming" {
  source = "../../modules/naming"

  env     = var.env
  project = var.project
  app     = var.app
}

# -------------------------------------------------------------------
# VPC: Default VPC for Shanghai region
# -------------------------------------------------------------------
resource "volcengine_vpc" "default" {
  vpc_name    = "Default"
  cidr_block  = "172.31.0.0/16"
  description = "System created default VPC."
}

# -------------------------------------------------------------------
# Subnet: Default subnet in Shanghai-A zone
# -------------------------------------------------------------------
resource "volcengine_subnet" "default_a" {
  subnet_name = "Default"
  cidr_block  = "172.31.0.0/20"
  zone_id     = "cn-shanghai-a"
  vpc_id      = volcengine_vpc.default.id
  description = "System created default Subnet."
}

# -------------------------------------------------------------------
# Security Group: Default security group for dev environment
# -------------------------------------------------------------------
resource "volcengine_security_group" "default" {
  security_group_name = "Default"
  vpc_id              = volcengine_vpc.default.id
  description         = "默认安全组"
}

# -------------------------------------------------------------------
# Outputs (handy for referencing from other tools / scripts)
# -------------------------------------------------------------------
output "tags" {
  description = "Standard tags applied to all resources"
  value       = module.tags.tags
}

output "name_prefix" {
  description = "Resource name prefix"
  value       = module.naming.name_prefix
}

output "vpc_default_id" {
  description = "ID of the default dev VPC"
  value       = volcengine_vpc.default.id
}

output "subnet_default_a_id" {
  description = "ID of the default dev subnet in cn-shanghai-a"
  value       = volcengine_subnet.default_a.id
}

output "sg_default_id" {
  description = "ID of the default dev security group"
  value       = volcengine_security_group.default.id
}
