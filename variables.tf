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
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_loggers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
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
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

