variable "env" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "region" {
  description = "Volcengine region"
  type        = string
  default     = "cn-shanghai"
}

variable "repo" {
  description = "Source repository"
  type        = string
  default     = "JianJianFeng97/volc-infra"
}

variable "extra_tags" {
  description = "Additional tags to merge into the standard tag set"
  type        = map(string)
  default     = {}
}
