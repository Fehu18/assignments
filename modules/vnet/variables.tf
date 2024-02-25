variable "resource_group" {
  description = "Resource group"
  type = object({
    name     = string
    location = string
  })
}

variable "vnet_name" {
  type        = string
  description = "Name of the application gateway vnet name"
  default = "vnet-engine-eastus2-001"
}

variable "address_space" {
  type        = list(string)
  nullable    = false
  description = " Vnet address range"
  default = [ "10.216.0.0/16" ]
}

#############################################################################
#Application gateway subnet details

variable "subnet_kv_name" {
  type        = string
  description = "subnet front end name"
  default = "snet-kv-engine-eastus2-002"
}

variable "subnet_kv_address_space" {
  type        = list(string)
  nullable    = false
  description = "subnet address range"
  default = [ "10.216.0.0/24" ]
}

variable "subnet_vm_name" {
  type        = string
  description = " ubnet name"
  default = "snet-vm-engine-eastus2-001"
}

variable "subnet_vm_address_space" {
  type        = list(string)
  nullable    = false
  description = " address range"
  default = [ "10.216.2.0/24" ]
}
