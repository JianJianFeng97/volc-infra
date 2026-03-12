# Default variable values for the dev environment.
# Sensitive values (volcengine_access_key / volcengine_secret_key) must
# be supplied via environment variables – do NOT add them here.
#
# This file is listed in .gitignore (*.tfvars) to avoid accidental
# secret leakage.  The CI pipeline uses `-backend=false` and skips
# plan when no credentials are available.

env    = "dev"
region = "cn-shanghai"
repo   = "JianJianFeng97/volc-infra"
