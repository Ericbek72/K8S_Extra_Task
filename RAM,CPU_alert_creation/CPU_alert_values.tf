module "cpu_alert_policy"{
    source = "git@github.com:Ericbek72/K8S_Extra_Task/CPU_alert_module"
    project_id = "fine-effect-382702"
    cpu_alert_pol = "CRITICAL - High CPU usage on cluster-2 tf-alert-module-workflow"
    cpu_alert_pol_cond = "CRITICAL - High CPU usage on cluster-2-terraform-module"
    cpu-threshold-filter = "resource.type = \"k8s_node\" AND metric.type = \"kubernetes.io/node/cpu/allocatable_utilization\""
    cpu-wait-time = "0s"
    cpu-threshold = 0.15
    cpu-alert-if-th-above = "COMPARISON_GT" #GT - greater than
    spike-duration = "3600s"
    aligner-type = "ALIGN_MEAN"
    alert-if-occured-num-times = 1
    doc-content = "1. Check the cluster\n2. Enable Autoscaling\n3. If 1st two didn't help, delete the pod"
#     notification_channels = [
#         module.notification_channel.google_monitoring_notification_channel.email_notice.name
#   ]
}