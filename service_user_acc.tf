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

resource "google_project_iam_binding" "iam_binding" {
  project = "fine-effect-382702"
  role    = "roles/resourcemanager.projectIamAdmin"
  members = [
    "user:erkin.bektenov@fulbrightmail.org",
  ]
}

resource "google_project_iam_member" "notification_channel_editor" {
  project = "fine-effect-382702"
  role    = "roles/iam.serviceAccountUser"
  #role    = "roles/monitoring.notificationChannelEditor"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "owner" {
  project = "fine-effect-382702"
  role    = "roles/owner"
  member  = "user:erkin.bektenov@fulbrightmail.org"
}

resource "google_project_iam_member" "project_iam_admin" {
  project = "fine-effect-382702"
  role    = "roles/resourcemanager.projectIamAdmin"
  member  = "user:erkin.bektenov@fulbrightmail.org"
}

resource "google_project_iam_member" "organization_admin" {
  project = "fine-effect-382702"
  role    = "roles/resourcemanager.organizationAdmin"
  member  = "user:erkin.bektenov@fulbrightmail.org"
}

resource "google_project_iam_member" "service_account_admin" {
  project = "fine-effect-382702"
  role    = "roles/iam.serviceAccountAdmin"
  member  = "user:erkin.bektenov@fulbrightmail.org"
}