
# resource "google_service_account" "service_account" {
#   account_id   = "alerting-sa"
#   display_name = "SA for Alerting Policies"
# }

# resource "google_monitoring_alert_policy" "memory_alert_policy" {
#   display_name = "CRITICAL - High memory usage on erkins-1st-cluster tf-alert"
#   combiner     = "OR"
#   conditions {
#     display_name = "CRITICAL - High memory usage on erkins-1st-cluster-terraform"
#     condition_threshold {
#       filter     = "resource.type = \"k8s_node\" AND metric.type = \"kubernetes.io/node/memory/allocatable_utilization\""
#       duration   = "0s"
#       threshold_value = 0.57
#       comparison = "COMPARISON_GT" #GT - greater than
#       aggregations {
#         alignment_period   = "3600s"
#         per_series_aligner = "ALIGN_MEAN"
#       }
#       trigger {
#         count = 1
#       }
#     }
#   }
#   notification_channels = [
#   google_monitoring_notification_channel.email_notice.name
# ]
#   documentation {
#     content     = "1. Check the cluster\n2. Enable Autoscaling\n3. If 1st two didn't help, delete the pod"
#     mime_type   = "text/markdown"
#   }
#   user_labels = {
#     way_created = "create_by_tf_file"
#   }
# }

#  resource "google_monitoring_notification_channel" "email_notice" {
#   display_name = "Test Notification Channel"
#   type         = "email"
#   labels = {
#     email_address = "bekerik7@gmail.com"
#   }
#   force_delete = false
# }