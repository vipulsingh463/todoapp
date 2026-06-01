variable "subnets" {
  description = "Map of subnets to create inside VNets"
  type = map(object({
    subnet_name      = string
    rg_name          = string
    vnet_name        = string
    address_prefixes = list(string)
  }))
}