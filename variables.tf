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
    buffered            = optional(bool)
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
  # path: eventhub.connection_string
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: eventhub.endpoint_uri
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: eventhub.user_assigned_identity_client_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: application_insights.connection_string
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: application_insights.instrumentation_key
  #   condition: length(value) > 0
  #   message:   must not be empty
}

