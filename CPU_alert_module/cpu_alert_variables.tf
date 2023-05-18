variable "project_id" {
    type = string
}

variable "cpu_alert_pol" {
    type = string
}

variable "cpu_alert_pol_cond" {
    type = string
}

variable "cpu-threshold-filter" {
    type = string
}

variable "cpu-wait-time" {
    type = string
}

variable "cpu-threshold" {
    type = number
}

variable "cpu-alert-if-th-above" {
    type = string
}

variable "spike-duration" {
    type = string
}

variable "aligner-type" {
    type = string
}

variable "alert-if-occured-num-times" {
    type = number
}

variable "doc-content" {
    type = string
}
