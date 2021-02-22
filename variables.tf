variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
  default     = "rg-test"
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
  default     = "North Europe"
}

variable "security_group_name" {
  description = "Network security group name."
  type        = string
  default     = "nsg-test"
}

variable "rules" {
  description = "Security rules for the network security group."
  type        = list
  default = [
    {
      name                       = "AllowHTTP"
      priority                   = "100"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
      description                = "http-rule"
    }
  ]
}

variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used."
  type        = list(string)
  default     = ["*"]
}

variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used."
  type        = list(string)
  default     = ["*"]
}

variable "tags" {
  description = "The tags to associate with your network security group."
  type        = map(string)
  default     = {}
}
