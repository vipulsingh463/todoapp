rgs = {
  rg_network = {
    name     = "rg-network-prod"
    location = "centralindia"
    tags = {
      environment = "prod"
      team        = "network"
    }
  }

  rg_compute = {
    name     = "rg-compute-prod"
    location = "centralindia"
    tags = {
      environment = "prod"
      team        = "compute"
    }
  }
}

vnets = {
  vnet_main = {
    vnet_name     = "frontend-vnet"
    location      = "centralindia"
    rg_name       = "rg-network-prod"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet_app = {
    subnet_name      = "snet-app"
    rg_name          = "rg-network-prod"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet_db = {
    subnet_name      = "snet-db"
    rg_name          = "rg-network-prod"
    vnet_name        = "frontend-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

pips = {
  pip_vm_web = {
    pip_name          = "pip-vm-web-01"
    rg_name           = "rg-network-prod"
    location          = "centralindia"
    allocation_method = "Static"
  }

  pip_vm_app = {
    pip_name          = "pip-vm-app-01"
    rg_name           = "rg-network-prod"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

vms = {
  vm_web = {
    vm_name     = "vm-web-01"
    nic_name    = "nic-web-01"
    location    = "centralindia"
    rg_name     = "rg-network-prod"
    vnet_name   = "frontend-vnet"
    subnet_name = "snet-app"

    pip_name = "pip-vm-web-01"

    size = "Standard_D2s_v5"
    admin_username = "azureadmin"
    admin_password = "P@ssw0rd12345!"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }

  vm_app = {
    vm_name     = "vm-app-01"
    nic_name    = "nic-app-01"
    location    = "centralindia"
    rg_name     = "rg-network-prod"
    vnet_name   = "frontend-vnet"
    subnet_name = "snet-app"

    pip_name = "pip-vm-app-01"

    size = "Standard_D2s_v5"
    admin_username = "azureadmin"
    admin_password = "P@ssw0rd12345!"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
