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
    buffered            = optional(bool, true)
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
}

