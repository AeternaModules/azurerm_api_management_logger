output "api_management_loggers_id" {
  description = "Map of id values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.id }
}
output "api_management_loggers_api_management_name" {
  description = "Map of api_management_name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.api_management_name }
}
output "api_management_loggers_application_insights" {
  description = "Map of application_insights values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.application_insights }
  sensitive   = true
}
output "api_management_loggers_buffered" {
  description = "Map of buffered values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.buffered }
}
output "api_management_loggers_description" {
  description = "Map of description values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.description }
}
output "api_management_loggers_eventhub" {
  description = "Map of eventhub values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.eventhub }
  sensitive   = true
}
output "api_management_loggers_name" {
  description = "Map of name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.name }
}
output "api_management_loggers_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.resource_group_name }
}
output "api_management_loggers_resource_id" {
  description = "Map of resource_id values across all api_management_loggers, keyed the same as var.api_management_loggers"
  value       = { for k, v in azurerm_api_management_logger.api_management_loggers : k => v.resource_id }
}

