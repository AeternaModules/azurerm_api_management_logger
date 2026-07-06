output "api_management_loggers" {
  description = "All api_management_logger resources"
  value       = azurerm_api_management_logger.api_management_loggers
  sensitive   = true
}
output "api_management_loggers_api_management_name" {
  description = "List of api_management_name values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.api_management_name]
}
output "api_management_loggers_application_insights" {
  description = "List of application_insights values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.application_insights]
  sensitive   = true
}
output "api_management_loggers_buffered" {
  description = "List of buffered values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.buffered]
}
output "api_management_loggers_description" {
  description = "List of description values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.description]
}
output "api_management_loggers_eventhub" {
  description = "List of eventhub values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.eventhub]
  sensitive   = true
}
output "api_management_loggers_name" {
  description = "List of name values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.name]
}
output "api_management_loggers_resource_group_name" {
  description = "List of resource_group_name values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.resource_group_name]
}
output "api_management_loggers_resource_id" {
  description = "List of resource_id values across all api_management_loggers"
  value       = [for k, v in azurerm_api_management_logger.api_management_loggers : v.resource_id]
}

