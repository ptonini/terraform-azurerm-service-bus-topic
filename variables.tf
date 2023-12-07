variable "name" {}

variable "namespace_id" {}

variable "auto_delete_on_idle" {
  default  = "P10675199DT2H48M5.4775807S"
  nullable = false
}

variable "default_message_ttl" {
  default  = "P10675199DT2H48M5.4775807S"
  nullable = false
}

variable "duplicate_detection_history_time_window" {
  default  = "PT10M"
  nullable = false
}

variable "enable_batched_operations" {
  default  = true
  nullable = false
}

variable "enable_express" {
  default  = false
  nullable = false
}

variable "enable_partitioning" {
  default  = false
  nullable = false
}

variable "max_size_in_megabytes" {
  default = null
}

variable "requires_duplicate_detection" {
  default  = false
  nullable = false
}

variable "support_ordering" {
  default  = true
  nullable = false
}

variable "subscriptions" {
  type = map(object({
    dead_lettering_on_filter_evaluation_error = optional(string)
    dead_lettering_on_message_expiration      = optional(string)
    lock_duration                             = optional(string)
    max_delivery_count                        = optional(string)
    auto_delete_on_idle                       = optional(string)
    default_message_ttl                       = optional(string)
    enable_batched_operations                 = optional(string)
  }))
  default  = {}
  nullable = false
}