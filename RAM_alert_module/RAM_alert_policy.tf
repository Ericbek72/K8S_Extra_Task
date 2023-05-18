module "notification_channel"{
    source = "../Notif_Chan_Module"
    project_id = "fine-effect-382702"
    notif-name = "My_personal_email"
    notif-type = "email"
    address = "bekerik7@gmail.com"
}

resource "google_monitoring_alert_policy" "memory_alert_policy" {
  project       = var.project_id
  display_name = var.ram_alert_pol
  combiner     = "OR"
  conditions {
    display_name = var.ram_alert_pol_cond
    condition_threshold {
      filter     = var.ram-threshold-filter
      duration   = var.ram-wait-time
      threshold_value = var.ram-threshold
      comparison = var.ram-alert-if-th-above
      aggregations {
        alignment_period   = var.spike-duration
        per_series_aligner = var.aligner-type
      }
      trigger {
        count = var.alert-if-occured-num-times
      }
    }
  }
  notification_channels = [
  module.notification_channel.channel_id
]
  documentation {
    content     = var.doc-content
    mime_type   = "text/markdown" #currently only this format is supported, so no need to soft code
  }
  user_labels = {
    way_created = "create_by_module_tf_file"
  }
}