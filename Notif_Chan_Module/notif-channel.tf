 resource "google_monitoring_notification_channel" "email_notice" {
  project       = var.project_id
  display_name = var.notif-name
  type         = var.notif-type
  labels = {
    email_address = var.address
  }
  force_delete = false
}