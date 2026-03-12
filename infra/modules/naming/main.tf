terraform {
  required_version = ">= 1.6"
}

locals {
  # Base prefix: always starts with env (e.g. "dev" or "prod")
  base = var.env

  # Append project and app segments when provided
  with_project = var.project != "" ? "${local.base}-${var.project}" : local.base
  with_app     = var.app != "" ? "${local.with_project}-${var.app}" : local.with_project

  # Final prefix includes a trailing hyphen for easy concatenation
  name_prefix = "${local.with_app}-"
}
