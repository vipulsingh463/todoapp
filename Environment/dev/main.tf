module "resource_group" {
    source = "../../Modules/resource_group"

    rgs = var.rgs 
}

module "virtual_network" {
    source = "../../Modules/azurerm_virtual_network"
    depends_on = [ module.resource_group ]

    vnets = var.vnets
}

module "public_ip" {
    source = "../../Modules/public _ip"
    depends_on = [ module.resource_group, module.virtual_network ]

    pips = var.pips
}

module "virtual_machine" {
    source = "../../Modules/azurerm_virtual_machine"
    depends_on = [ module.resource_group, module.virtual_network , module.public_ip ]

    vms = var.vms
}

module "subnet"  {
    source = "../../Modules/azurerm_subnet"
    depends_on = [ module.virtual_network ]

    subnets = var.subnets
}