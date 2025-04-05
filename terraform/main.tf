terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "gcs" {
    bucket  = "pde-statefiles"
    prefix  = "pde/state"
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

# Loop through all policies
module "opa_policies" {
  source = "./modules"
  for_each = var.policies

  policy_path       = each.value.path
  constraint_file   = each.value.constraint
  policy_name       = each.key
  project_id        = var.project_id
}
