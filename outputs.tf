output "express_route_connections" {
  description = "All express_route_connection resources"
  value       = azurerm_express_route_connection.express_route_connections
}
output "express_route_connections_authorization_key" {
  description = "List of authorization_key values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.authorization_key]
}
output "express_route_connections_enable_internet_security" {
  description = "List of enable_internet_security values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.enable_internet_security]
}
output "express_route_connections_express_route_circuit_peering_id" {
  description = "List of express_route_circuit_peering_id values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.express_route_circuit_peering_id]
}
output "express_route_connections_express_route_gateway_bypass_enabled" {
  description = "List of express_route_gateway_bypass_enabled values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.express_route_gateway_bypass_enabled]
}
output "express_route_connections_express_route_gateway_id" {
  description = "List of express_route_gateway_id values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.express_route_gateway_id]
}
output "express_route_connections_internet_security_enabled" {
  description = "List of internet_security_enabled values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.internet_security_enabled]
}
output "express_route_connections_name" {
  description = "List of name values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.name]
}
output "express_route_connections_private_link_fast_path_enabled" {
  description = "List of private_link_fast_path_enabled values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.private_link_fast_path_enabled]
}
output "express_route_connections_routing" {
  description = "List of routing values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.routing]
}
output "express_route_connections_routing_weight" {
  description = "List of routing_weight values across all express_route_connections"
  value       = [for k, v in azurerm_express_route_connection.express_route_connections : v.routing_weight]
}

