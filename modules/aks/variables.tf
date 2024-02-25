variable "resource_group" {
  description = "Resource group"
  type = object({
    name     = string
    location = string
  })
}

variable "cluster_name" {
  type        = string
  description = "AKS cluster Name"
}

variable "oidc_issuer_enabled" {
  type        = bool
  default     = false
  description = "enable/disable OIDC issuer URL (true if enable)"
}

variable "workload_identity_enabled" {
  type        = bool
  default     = false
  description = "enable/disable Azure AD Workload Identity (true if enable)"
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The ID of a Subnet where the Kubernetes default node pool should exist."
}

variable "sku_tier" {
  type        = string
  default     = "Free"
  description = "The SKU Tier that should be used for this Kubernetes Cluster."
}

variable "azure_policy_enabled" {
  type        = bool
  default     = false
  description = "enable/disable Azure policy Add-On (enabled if true)"
}

variable "local_account_disabled" {
  type        = bool
  default     = false
  description = "enable/disable local accounts (disabled if true)"
}

variable "network_profile" {
  type = object({
    network_policy    = optional(string)
    network_plugin    = optional(string, "kubenet")
    load_balancer_sku = optional(string, "standard")
  })
  description = "Network Profile for AKS cluster"
}

variable "default_node_pool" {
  type = object({
    name                    = string
    orchestrator_version    = optional(string)
    os_disk_type            = optional(string, "Managed")
    os_disk_size_gb         = optional(number, 128)
    vm_size                 = string
    enable_auto_scaling     = optional(bool, true)
    min_count               = number
    max_count               = number
    node_labels             = map(string)
    tags                    = optional(map(string), {})
    zones                   = list(string)
    critical_addons_enabled = bool
  })
}

variable "kubernetes_version" {
  type    = string
  default = "1.27.9"
}

variable "api_server_authorized_ip_ranges" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
