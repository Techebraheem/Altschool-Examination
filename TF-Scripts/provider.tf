

# terraform {
#   required_providers {
#     random = {
#       source = "hashicorp/random"
#     }
#     azurerm = {
#       source = "hashicorp/azurerm"
      
#     }
#   }
# }

# provider "azurerm" {

#   tenant_id       = var.azure_tenant_id
#   subscription_id = var.azure_subscription_id
#   skip_provider_registration = true


#   features {

#     # resource_group {
#     #   prevent_deletion_if_contains_resources = false
#     # }
    
#   }
# }

# terraform {
#   required_providers {
#     ad = {
#       source = "hashicorp/ad"
#       version = "0.5.0"
#     }
#   }
# }

# provider "ad" {
#   # Configuration options
# }

#as many providers can be specified on this block.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.110.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.31.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

 provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.clustername.kube_config[0].host
  username               = data.azurerm_kubernetes_cluster.clustername.kube_config[0].username
  password               = data.azurerm_kubernetes_cluster.clustername.kube_config[0].password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.clustername.kube_config[0].client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.clustername.kube_config[0].client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.clustername.kube_config[0].cluster_ca_certificate)
}