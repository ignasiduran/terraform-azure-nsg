# terraform-azure-nsg

## Create a network security group

This Terraform module deploys a Network Security Group (NSG) in Azure.

## Usage 


```hcl
module "nsg_frontend" {
  source              = "git@github.com:ignasiduran/terraform-azure-nsg.git"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.general.location
  security_group_name = "nsg-frontend"
  rules = [
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

  tags = {
    environment = "test"
    manage      = "terraform"
  }
}
```
