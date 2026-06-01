variable "pips" {
  description = "Map of Public IP configurations"
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}