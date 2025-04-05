resource "google_project_service" "container" {
  project = var.project_id
  service = "container.googleapis.com"
}

# Upload OPA policy file to GKE as ConfigMap (simplified simulation)
resource "kubernetes_config_map" "opa_policy" {
  metadata {
    name      = var.policy_name
    namespace = "gatekeeper-system"
  }

  data = {
    "policy.rego" = file(var.policy_path)
  }
}

# Apply constraint YAML file
resource "null_resource" "constraint" {
  provisioner "local-exec" {
    command = "kubectl apply -f ${var.constraint_file}"
  }

  depends_on = [kubernetes_config_map.opa_policy]
}
