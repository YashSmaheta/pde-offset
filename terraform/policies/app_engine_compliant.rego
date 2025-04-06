package app_engine.security

deny[msg] {
  input.resource_changes[_].type == "google_app_engine_application"
  input.resource_changes[_].change.after.location_id != "us-central"
  msg := "App Engine must be deployed in us-central only."
}
