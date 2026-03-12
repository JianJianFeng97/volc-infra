terraform {
  required_version = ">= 1.6"
}

locals {
  standard_tags = {
    Environment = var.env
    ManagedBy   = "terraform"
    Region      = var.region
    Repo        = var.repo
  }

  tags = merge(local.standard_tags, var.extra_tags)
}
