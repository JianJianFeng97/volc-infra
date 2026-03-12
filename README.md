# Volc Infra

Infrastructure-as-Code (IaC) repository for **Volcengine** (火山引擎), region `cn-shanghai`.
Manages `dev` and `prod` environments with Terraform `>= 1.6`.

---

## Directory Structure

```
.
├── .github/
│   └── workflows/
│       └── terraform-ci.yml   # CI: fmt / init / validate / plan on every PR
├── docs/
│   └── workflow.md            # GitOps flow, credential & state management
├── infra/
│   ├── envs/
│   │   ├── dev/               # Development environment
│   │   │   ├── backend.tf
│   │   │   ├── main.tf
│   │   │   ├── providers.tf
│   │   │   ├── terraform.tfvars
│   │   │   └── variables.tf
│   │   └── prod/              # Production environment
│   │       ├── backend.tf
│   │       ├── main.tf
│   │       ├── providers.tf
│   │       ├── terraform.tfvars
│   │       └── variables.tf
│   └── modules/
│       ├── naming/            # Outputs name_prefix (e.g. "dev-" / "prod-")
│       └── tags/              # Outputs standard tag map
└── scripts/
    └── openapi/               # Placeholder for OpenAPI helper scripts
```

---

## Quick Start

### Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.6`
- Volcengine account with an Access Key / Secret Key

### Run locally (dev environment)

```bash
# 1. Export credentials – never store them in files.
export VOLCENGINE_ACCESS_KEY="<your-ak>"
export VOLCENGINE_SECRET_KEY="<your-sk>"

# 2. Go to the environment directory.
cd infra/envs/dev

# 3. Initialise (local state – no remote backend required).
terraform init -backend=false

# 4. Validate syntax and types.
terraform validate

# 5. Preview changes.
terraform plan \
  -var="volcengine_access_key=$VOLCENGINE_ACCESS_KEY" \
  -var="volcengine_secret_key=$VOLCENGINE_SECRET_KEY"

# 6. Apply (after careful review).
terraform apply \
  -var="volcengine_access_key=$VOLCENGINE_ACCESS_KEY" \
  -var="volcengine_secret_key=$VOLCENGINE_SECRET_KEY"
```

Repeat steps 3–6 in `infra/envs/prod/` for the production environment.

---

## Environments

| Env  | Name prefix | Tag `Environment` | Directory           |
|------|-------------|-------------------|---------------------|
| dev  | `dev-`      | `dev`             | `infra/envs/dev/`   |
| prod | `prod-`     | `prod`            | `infra/envs/prod/`  |

All resources share a common set of tags:
`Environment`, `ManagedBy=terraform`, `Region=cn-shanghai`, `Repo=JianJianFeng97/volc-infra`.

---

## CI

A GitHub Actions workflow (`.github/workflows/terraform-ci.yml`) triggers on
every pull request to `main` that touches `infra/**`.

| Step                            | Needs credentials | Required |
|---------------------------------|-------------------|----------|
| `terraform fmt -check`          | No                | ✅        |
| `terraform init -backend=false` | No                | ✅        |
| `terraform validate`            | No                | ✅        |
| `terraform plan`                | Yes               | ⚠️ optional |

See [`docs/workflow.md`](docs/workflow.md) for full details on credential
management, state management, and the GitOps flow.