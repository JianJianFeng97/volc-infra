variable "env" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "project" {
  description = "Optional project name to include in the name prefix"
  type        = string
  default     = ""
}

variable "app" {
  description = "Optional application name to include in the name prefix"
  type        = string
  default     = ""
}
