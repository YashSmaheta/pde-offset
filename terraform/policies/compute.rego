package gcp.security

violation[{"msg": msg}] {
  input.spec.networkInterfaces[_].accessConfigs[_].natIP
  msg := "Public IPs are not allowed for Compute Engine instances"
}
