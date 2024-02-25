output "kubernetes_cluster" {
  value = azurerm_kubernetes_cluster.k8s
}

output "public_ip_address" {
  value = azurerm_public_ip.ip_aks
}
