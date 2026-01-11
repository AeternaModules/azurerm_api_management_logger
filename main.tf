resource "azurerm_api_management_logger" "api_management_loggers" {
  for_each = var.api_management_loggers

  api_management_name = each.value.api_management_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  buffered            = each.value.buffered
  description         = each.value.description
  resource_id         = each.value.resource_id

  dynamic "application_insights" {
    for_each = each.value.application_insights != null ? [each.value.application_insights] : []
    content {
      connection_string   = application_insights.value.connection_string
      instrumentation_key = application_insights.value.instrumentation_key
    }
  }

  dynamic "eventhub" {
    for_each = each.value.eventhub != null ? [each.value.eventhub] : []
    content {
      connection_string                = eventhub.value.connection_string
      endpoint_uri                     = eventhub.value.endpoint_uri
      name                             = eventhub.value.name
      user_assigned_identity_client_id = eventhub.value.user_assigned_identity_client_id
    }
  }
}

