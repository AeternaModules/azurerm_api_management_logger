output "api_management_loggers_id" {
  description = "Map of id values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "api_management_loggers_api_management_name" {
  description = "Map of api_management_name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.api_management_name if v.api_management_name != null && length(v.api_management_name) > 0 }
}
output "api_management_loggers_application_insights" {
  description = "Map of application_insights values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.application_insights if v.application_insights != null && length(v.application_insights) > 0 }
  sensitive   = true
}
output "api_management_loggers_buffered" {
  description = "Map of buffered values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.buffered if v.buffered != null }
}
output "api_management_loggers_description" {
  description = "Map of description values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "api_management_loggers_eventhub" {
  description = "Map of eventhub values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.eventhub if v.eventhub != null && length(v.eventhub) > 0 }
  sensitive   = true
}
output "api_management_loggers_name" {
  description = "Map of name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "api_management_loggers_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "api_management_loggers_resource_id" {
  description = "Map of resource_id values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.resource_id if v.resource_id != null && length(v.resource_id) > 0 }
}

