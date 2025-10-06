provider "azurerm" {
  features {}
  subscription_id = "838d8d5b-1157-4504-a71d-1ef48775bbe3"
}


##############################################
# FRONTEND
##############################################

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"

}



resource "azurerm_network_interface" "frontend" {
  name                = "frontend"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "frontend"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_virtual_machine" "frontend" {
  name                  = "frontend"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size               = "Standard_D2s_v3"

  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "frontend-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}


##############################################
# MONGODB
##############################################
resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "mongodb"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mongodb.id
  }
}

resource "azurerm_virtual_machine" "mongodb" {
  name                  = "mongodb"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "mongodb-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "mongodb"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# CATALOGUE
##############################################
resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "catalogue"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.catalogue.id
  }
}

resource "azurerm_virtual_machine" "catalogue" {
  name                  = "catalogue"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "catalogue-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "catalogue"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# REDIS
##############################################
resource "azurerm_public_ip" "redis" {
  name                = "redis"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "redis" {
  name                = "redis"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "redis"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.redis.id
  }
}

resource "azurerm_virtual_machine" "redis" {
  name                  = "redis"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.redis.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "redis-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "redis"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# USER
##############################################
resource "azurerm_public_ip" "user" {
  name                = "user"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "user"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "user"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.user.id
  }
}

resource "azurerm_virtual_machine" "user" {
  name                  = "user"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "user-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "user"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# CART
##############################################
resource "azurerm_public_ip" "cart" {
  name                = "cart"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "cart"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "cart"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cart.id
  }
}

resource "azurerm_virtual_machine" "cart" {
  name                  = "cart"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "cart-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "cart"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# MYSQL
##############################################
resource "azurerm_public_ip" "mysql" {
  name                = "mysql"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "mysql"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "mysql"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mysql.id
  }
}

resource "azurerm_virtual_machine" "mysql" {
  name                  = "mysql"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "mysql-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "mysql"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# SHIPPING
##############################################
resource "azurerm_public_ip" "shipping" {
  name                = "shipping"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "shipping"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "shipping"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.shipping.id
  }
}

resource "azurerm_virtual_machine" "shipping" {
  name                  = "shipping"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "shipping-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "shipping"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# RABBITMQ
##############################################
resource "azurerm_public_ip" "rabbitmq" {
  name                = "rabbitmq"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "rabbitmq"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rabbitmq.id
  }
}

resource "azurerm_virtual_machine" "rabbitmq" {
  name                  = "rabbitmq"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "rabbitmq-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "rabbitmq"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# PAYMENT
##############################################
resource "azurerm_public_ip" "payment" {
  name                = "payment"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "payment"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "payment"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.payment.id
  }
}

resource "azurerm_virtual_machine" "payment" {
  name                  = "payment"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "payment-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "payment"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

##############################################
# DISPATCH
##############################################
resource "azurerm_public_ip" "dispatch" {
  name                = "dispatch"
  location            = "East US"
  resource_group_name = "project-ecom"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "dispatch" {
  name                = "dispatch"
  location            = "East US"
  resource_group_name = "project-ecom"

  ip_configuration {
    name                          = "dispatch"
    subnet_id                     = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dispatch.id
  }
}

resource "azurerm_virtual_machine" "dispatch" {
  name                  = "dispatch"
  location              = "East US"
  resource_group_name   = "project-ecom"
  network_interface_ids = [azurerm_network_interface.dispatch.id]
  vm_size               = "Standard_D2s_v3"
  delete_os_disk_on_termination = true

  storage_image_reference {
    id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
  }

  storage_os_disk {
    name              = "dispatch-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "dispatch"
    admin_username = "tushar"
    admin_password = "tushar@12345"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name   = "project-ecom"
  ttl                 = 3
  records             = [azurerm_network_interface.frontend.private_ip_address]
}


# MONGODB
resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.mongodb.ip_address]
}

# CATALOGUE
resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.catalogue.ip_address]
}

# REDIS
resource "azurerm_dns_a_record" "redis" {
  name                = "redis-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.redis.ip_address]
}

# USER
resource "azurerm_dns_a_record" "user" {
  name                = "user-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.user.ip_address]
}

# CART
resource "azurerm_dns_a_record" "cart" {
  name                = "cart-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.cart.ip_address]
}

# MYSQL
resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.mysql.ip_address]
}

# SHIPPING
resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.shipping.ip_address]
}

# RABBITMQ
resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "rabbitmq-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.rabbitmq.ip_address]
}

# PAYMENT
resource "azurerm_dns_a_record" "payment" {
  name                = "payment-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.payment.ip_address]
}

# DISPATCH
resource "azurerm_dns_a_record" "dispatch" {
  name                = "dispatch-dev"
  zone_name           = "tusharbytes.com"
  resource_group_name = "project-ecom"
  ttl                 = 300
  records             = [azurerm_public_ip.dispatch.ip_address]
}
