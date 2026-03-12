# -------------------------------------------------------------------
# Volcengine provider configuration
#
# Credentials must be supplied at runtime via environment variables
# (never commit AK/SK to source control):
#
#   export VOLCENGINE_ACCESS_KEY="<your-access-key>"
#   export VOLCENGINE_SECRET_KEY="<your-secret-key>"
#
# Alternatively, pass them through the Terraform CLI:
#   terraform plan \
#     -var="volcengine_access_key=$VOLCENGINE_ACCESS_KEY" \
#     -var="volcengine_secret_key=$VOLCENGINE_SECRET_KEY"
# -------------------------------------------------------------------
provider "volcengine" {
  access_key = var.volcengine_access_key
  secret_key = var.volcengine_secret_key
  region     = var.region
}
