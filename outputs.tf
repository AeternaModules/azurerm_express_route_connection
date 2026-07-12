output "express_route_connections_authorization_key" {
  description = "Map of authorization_key values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.authorization_key }
}
output "express_route_connections_enable_internet_security" {
  description = "Map of enable_internet_security values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.enable_internet_security }
}
output "express_route_connections_express_route_circuit_peering_id" {
  description = "Map of express_route_circuit_peering_id values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_circuit_peering_id }
}
output "express_route_connections_express_route_gateway_bypass_enabled" {
  description = "Map of express_route_gateway_bypass_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_gateway_bypass_enabled }
}
output "express_route_connections_express_route_gateway_id" {
  description = "Map of express_route_gateway_id values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.express_route_gateway_id }
}
output "express_route_connections_internet_security_enabled" {
  description = "Map of internet_security_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.internet_security_enabled }
}
output "express_route_connections_name" {
  description = "Map of name values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.name }
}
output "express_route_connections_private_link_fast_path_enabled" {
  description = "Map of private_link_fast_path_enabled values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.private_link_fast_path_enabled }
}
output "express_route_connections_routing" {
  description = "Map of routing values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.routing }
}
output "express_route_connections_routing_weight" {
  description = "Map of routing_weight values across all express_route_connections, keyed the same as var.express_route_connections"
  value       = { for k, v in azurerm_express_route_connection.express_route_connections : k => v.routing_weight }
}

