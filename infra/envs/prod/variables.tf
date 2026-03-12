variable "env" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "region" {
  description = "Volcengine region"
  type        = string
  default     = "cn-shanghai"
}

variable "repo" {
  description = "Source repository (used in tags)"
  type        = string
  default     = "JianJianFeng97/volc-infra"
}

variable "project" {
  description = "Optional project name for resource naming"
  type        = string
  default     = ""
}

variable "app" {
  description = "Optional application name for resource naming"
  type        = string
  default     = ""
}

# -------------------------------------------------------------------
# Credentials – supplied via environment variables at runtime.
# Never commit real values.  See providers.tf for details.
# -------------------------------------------------------------------
variable "volcengine_access_key" {
  description = "Volcengine Access Key (set via VOLCENGINE_ACCESS_KEY env var)"
  type        = string
  default     = ""
  sensitive   = true
}

variable "volcengine_secret_key" {
  description = "Volcengine Secret Key (set via VOLCENGINE_SECRET_KEY env var)"
  type        = string
  default     = ""
  sensitive   = true
}
