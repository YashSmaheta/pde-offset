project_id = "policydeploymentengine"
region     = "australia-southeast2"

policies = {
  compute-no-public-ip = {
    path       = "./policies/compute.rego"
    constraint = "../constraints/compute.yaml"
  },
  sql-require-ssl = {
    path       = "./policies/sql.rego"
    constraint = "../constraints/sql.yaml"
  }
}
