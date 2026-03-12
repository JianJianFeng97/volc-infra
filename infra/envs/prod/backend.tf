# -------------------------------------------------------------------
# Backend configuration
#
# By default the local backend is used so that `terraform init`
# works without any remote storage credentials.
#
# To switch to a remote TOS (Volcengine Object Storage) backend,
# uncomment and fill in the block below, then re-run:
#   terraform init -reconfigure
#
# terraform {
#   backend "s3" {
#     # Volcengine TOS is S3-compatible
#     bucket                      = "my-tfstate-bucket"
#     key                         = "volc-infra/prod/terraform.tfstate"
#     region                      = "cn-shanghai"
#     endpoint                    = "tos-s3-cn-shanghai.volces.com"
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     skip_region_validation      = true
#     force_path_style            = true
#   }
# }
# -------------------------------------------------------------------
