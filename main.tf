resource "azurerm_servicebus_topic" "this" {
  name                                    = var.name
  namespace_id                            = var.namespace_id
  auto_delete_on_idle                     = var.auto_delete_on_idle
  default_message_ttl                     = var.default_message_ttl
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  enable_batched_operations               = var.enable_batched_operations
  enable_express                          = var.enable_express
  enable_partitioning                     = var.enable_partitioning
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  support_ordering                        = var.support_ordering
}

module "subscriptions" {
  source  = "ptonini/service-bus-subscription/azurerm"
  version = "~> 1.0.0"
  for_each                                  = var.subscriptions
  name                                      = each.key
  topic_id                                  = azurerm_servicebus_topic.this.id
  dead_lettering_on_filter_evaluation_error = each.value.dead_lettering_on_filter_evaluation_error
  dead_lettering_on_message_expiration      = each.value.dead_lettering_on_message_expiration
  lock_duration                             = each.value.lock_duration
  max_delivery_count                        = each.value.max_delivery_count
  auto_delete_on_idle                       = each.value.auto_delete_on_idle
  default_message_ttl                       = each.value.default_message_ttl
  enable_batched_operations                 = each.value.enable_batched_operations
}