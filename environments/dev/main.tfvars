env = "dev"
ip_configuration_subnet_id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/virtualNetworks/main/subnets/default"
zone_name ="tusharbytes.com"
dns_record_rg_name    = "project-ecom"
storage_image_reference_id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Compute/images/local-devops-practice"
network_security_group_id = "/subscriptions/838d8d5b-1157-4504-a71d-1ef48775bbe3/resourceGroups/project-ecom/providers/Microsoft.Network/networkSecurityGroups/allow-all"


databases = {
    mongodb = {
      rgname = "eastus"
    }
    rabbitmq = {
      rgname = "eastus"
    }
    mysql = {
      rgname = "eastus"
    }
    redis = {
      rgname = "eastus"
    }
}

 applications = {
    catalogue = {
      rgname = "eastus"
    }
    user = {
      rgname = "eastus"
    }
    cart = {
      rgname = "eastus"
    }
    payment = {
      rgname = "eastus"
    }
    shipping = {
      rgname = "eastus"
    }
    dispatch = {
      rgname = "eastus"
    }
    frontend = {
      rgname = "eastus"
    }
}


rg_name = {
  eastus = {
    location = "East US"
  }
}
