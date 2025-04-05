package gcp.security.sql

violation[{"msg": msg}] {
  not input.spec.settings.ipConfiguration.requireSsl
  msg := "SQL instances must require SSL connections"
}
