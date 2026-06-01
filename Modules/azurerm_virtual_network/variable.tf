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
