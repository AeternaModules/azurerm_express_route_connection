output "express_route_connections_id" {
  description = "Map of id values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "express_route_connections_authorization_key" {
  description = "Map of authorization_key values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.authorization_key if v.authorization_key != null && length(v.authorization_key) > 0 }
}
output "express_route_connections_enable_internet_security" {
  description = "Map of enable_internet_security values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.enable_internet_security if v.enable_internet_security != null }
}
output "express_route_connections_express_route_circuit_peering_id" {
  description = "Map of express_route_circuit_peering_id values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_circuit_peering_id if v.express_route_circuit_peering_id != null && length(v.express_route_circuit_peering_id) > 0 }
}
output "express_route_connections_express_route_gateway_bypass_enabled" {
  description = "Map of express_route_gateway_bypass_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_gateway_bypass_enabled if v.express_route_gateway_bypass_enabled != null }
}
output "express_route_connections_express_route_gateway_id" {
  description = "Map of express_route_gateway_id values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_gateway_id if v.express_route_gateway_id != null && length(v.express_route_gateway_id) > 0 }
}
output "express_route_connections_internet_security_enabled" {
  description = "Map of internet_security_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.internet_security_enabled if v.internet_security_enabled != null }
}
output "express_route_connections_name" {
  description = "Map of name values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "express_route_connections_private_link_fast_path_enabled" {
  description = "Map of private_link_fast_path_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.private_link_fast_path_enabled if v.private_link_fast_path_enabled != null }
}
output "express_route_connections_routing" {
  description = "Map of routing values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.routing if v.routing != null && length(v.routing) > 0 }
}
output "express_route_connections_routing_weight" {
  description = "Map of routing_weight values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.routing_weight if v.routing_weight != null }
}

