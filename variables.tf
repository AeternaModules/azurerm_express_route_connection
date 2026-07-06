variable "express_route_connections" {
  description = <<EOT
Map of express_route_connections, attributes below
Required:
    - express_route_circuit_peering_id
    - express_route_gateway_id
    - name
Optional:
    - authorization_key
    - enable_internet_security
    - express_route_gateway_bypass_enabled
    - internet_security_enabled
    - private_link_fast_path_enabled
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
    enable_internet_security             = optional(bool)
    express_route_gateway_bypass_enabled = optional(bool) # Default: false
    internet_security_enabled            = optional(bool)
    private_link_fast_path_enabled       = optional(bool)
    routing_weight                       = optional(number) # Default: 0
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
        v.routing == null || (v.routing.propagated_route_table == null || (v.routing.propagated_route_table.labels == null || (length(v.routing.propagated_route_table.labels) > 0)))
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
  # --- Unconfirmed validation candidates, derived from azurerm_express_route_connection's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ExpressRouteConnectionName] !matched
  # path: express_route_circuit_peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] !ok
  # path: express_route_circuit_peering_id
  #   source:    [from commonids.ValidateExpressRouteCircuitPeeringID] err != nil
  # path: express_route_gateway_id
  #   source:    [from expressroutegateways.ValidateExpressRouteGatewayID] !ok
  # path: express_route_gateway_id
  #   source:    [from expressroutegateways.ValidateExpressRouteGatewayID] err != nil
  # path: routing.inbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] !ok
  # path: routing.inbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] err != nil
  # path: routing.outbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] !ok
  # path: routing.outbound_route_map_id
  #   source:    [from virtualwans.ValidateRouteMapID] err != nil
  # path: routing.associated_route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: routing.associated_route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
  # path: routing.propagated_route_table.route_table_ids[*]
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: routing.propagated_route_table.route_table_ids[*]
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
}

