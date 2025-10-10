module "frontend" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "frontend"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "mongodb" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "mongodb"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}


module "cart" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "cart"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}


module "catalogue" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "catalogue"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "dispatch" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "dispatch"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "mysql" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "mysql"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "payment" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "cart"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}


module "rabbitmq" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "rabbitmq"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}
module "redis" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "redis"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "shipping" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "shipping"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}

module "user" {
  source                      = "./components"
  ip_configuration_subnet_id  = var.ip_configuration_subnet_id
  location                    = var.location
  name                        = "user"
  rg_name                     = var.rg_name
  storage_image_reference_id  = var.storage_image_reference_id
  zone_name                   = var.zone_name
  network_security_group_id = var.network_security_group_id
}



