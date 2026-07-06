variable "api_management_loggers" {
  description = <<EOT
Map of api_management_loggers, attributes below
Required:
    - api_management_name
    - name
    - resource_group_name
Optional:
    - buffered
    - description
    - resource_id
    - application_insights (block):
        - connection_string (optional)
        - instrumentation_key (optional)
    - eventhub (block):
        - connection_string (optional)
        - endpoint_uri (optional)
        - name (required)
        - user_assigned_identity_client_id (optional)
EOT

  type = map(object({
    api_management_name = string
    name                = string
    resource_group_name = string
    buffered            = optional(bool) # Default: true
    description         = optional(string)
    resource_id         = optional(string)
    application_insights = optional(object({
      connection_string   = optional(string)
      instrumentation_key = optional(string)
    }))
    eventhub = optional(object({
      connection_string                = optional(string)
      endpoint_uri                     = optional(string)
      name                             = string
      user_assigned_identity_client_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        v.eventhub == null || (v.eventhub.connection_string == null || (length(v.eventhub.connection_string) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        v.eventhub == null || (v.eventhub.endpoint_uri == null || (length(v.eventhub.endpoint_uri) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        v.eventhub == null || (v.eventhub.user_assigned_identity_client_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.eventhub.user_assigned_identity_client_id))))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        v.application_insights == null || (v.application_insights.connection_string == null || (length(v.application_insights.connection_string) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        v.application_insights == null || (v.application_insights.instrumentation_key == null || (length(v.application_insights.instrumentation_key) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_logger's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ApiManagementChildName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
  # path: resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: eventhub.name
  #   source:    validate.ValidateEventHubName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

