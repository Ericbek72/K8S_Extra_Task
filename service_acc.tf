resource "google_service_account" "service_account" {
  account_id   = "alerting-sa"
  display_name = "SA for Alerting Policies"
}

resource "google_project_iam_binding" "service_account_binding" {
  project = "fine-effect-382702"
  #role    = "roles/monitoring.alertPolicyEditor"
  role    = "roles/monitoring.notificationChannelEditor"
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_member" "notification_channel_editor" {
  project = "fine-effect-382702"
  role    = "roles/iam.serviceAccountUser"
  #role    = "roles/monitoring.notificationChannelEditor"
  member  = "serviceAccount:alerting-sa@fine-effect-382702.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "service_account_permissions" {
  project = "fine-effect-382702"
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}