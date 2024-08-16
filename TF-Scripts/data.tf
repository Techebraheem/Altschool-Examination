

data "azurerm_kubernetes_cluster" "clustername" {
  name                = "alx-aks"
  resource_group_name = "alx-deploy"
}

