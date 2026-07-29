variable "express_route_connections" {
  description = <<EOT
Map of express_route_connections, attributes below
Required:
    - express_route_circuit_peering_id
    - express_route_gateway_id
    - name
Optional:
    - authorization_key
    - express_route_gateway_bypass_enabled
    - internet_security_enabled
    - routing_weight
    - routing (block):
        - associated_route_table_id (optional)
        - inbound_route_map_id (optional)
        - outbound_route_map_id (optional)
        - propagated_route_table (optional, block):
            - labels (optional)
            - route_table_ids (optional)
EOT

  type = map(object({
    express_route_circuit_peering_id     = string
    express_route_gateway_id             = string
    name                                 = string
    authorization_key                    = optional(string)
    express_route_gateway_bypass_enabled = optional(bool)
    internet_security_enabled            = optional(bool)
    routing_weight                       = optional(number)
    routing = optional(object({
      associated_route_table_id = optional(string)
      inbound_route_map_id      = optional(string)
      outbound_route_map_id     = optional(string)
      propagated_route_table = optional(object({
        labels          = optional(set(string))
        route_table_ids = optional(list(string))
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.express_route_connections : (
        v.authorization_key == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.authorization_key)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_connections : (
        v.routing == null || (v.routing.propagated_route_table == null || (v.routing.propagated_route_table.labels == null || (alltrue([for x in v.routing.propagated_route_table.labels : length(x) > 0]))))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.express_route_connections : (
        v.routing_weight == null || (v.routing_weight >= 0 && v.routing_weight <= 32000)
      )
    ])
    error_message = "must be between 0 and 32000"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

