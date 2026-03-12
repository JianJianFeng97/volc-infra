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
