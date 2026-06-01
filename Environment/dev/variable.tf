# Resource Group
variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
    }
  ))
}

# Networking

variable "vnets" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = set(string)

    subnet = optional(map(object({
      subnet_name      = string
      address_prefixes = list(string)
    })))
  }))
}




# Public Ip 

variable "pips" {
  description = "Map of Public IP configurations"
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}

#Compute 
variable "vms" {
  type = map(object(
    {
      nic_name               = string
      location               = string
      rg_name                = string
      vnet_name              = string
      subnet_name            = string
      pip_name               = string
      vm_name                = string
      size                   = string
      admin_username         = string
      admin_password         = string
      source_image_reference = map(string)
    }
  ))
}


# subnets 
variable "subnets" {
  description = "Map of subnets to create inside VNets"
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}

