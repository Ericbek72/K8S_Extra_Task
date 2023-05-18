resource "google_service_account" "service_account" {
  account_id   = "alerting-sa"
  display_name = "SA for Alerting Policies"
}

resource "google_project_iam_binding" "service_account_binding" {
  project = "fine-effect-382702"
  role    = "roles/monitoring.alertPolicyEditor"

  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}