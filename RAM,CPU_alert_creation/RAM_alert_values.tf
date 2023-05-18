module "ram_alert_policy"{
    source = "git@github.com:Ericbek72/K8S_Extra_Task/RAM_alert_module"
    project_id = "fine-effect-382702"
    ram_alert_pol = "CRITICAL - High memory usage on erkins-1st-cluster tf-alert-module"
    ram_alert_pol_cond = "CRITICAL - High memory usage on erkins-1st-cluster-terraform-module"
    ram-threshold-filter = "resource.type = \"k8s_node\" AND metric.type = \"kubernetes.io/node/memory/allocatable_utilization\""
    ram-wait-time = "0s"
    ram-threshold = 0.57
    ram-alert-if-th-above = "COMPARISON_GT" #GT - greater than
    spike-duration = "3600s"
    aligner-type = "ALIGN_MEAN"
    alert-if-occured-num-times = 1
    doc-content = "1. Check the cluster\n2. Enable Autoscaling\n3. If 1st two didn't help, delete the pod"
#     notification_channels = [
#         module.notification_channel.channel_id
#   ]
}