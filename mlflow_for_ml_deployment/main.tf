resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = "dev"
  }
}

resource "azurerm_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
  depends_on          = [azurerm_resource_group.rg]

}


resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.appserviceplan.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    always_on = false
    application_stack {
      docker_image_name        = var.docker_image_name
      docker_registry_url      = "https://index.docker.io"
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
    }
  }


  depends_on = [azurerm_service_plan.appserviceplan]
}

#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  use_manual_integration = false
  branch                 = "master"
  repo_url               = "https://github.com/manuelgilm/mlflowcloud"
  github_action_configuration {
    generate_workflow_file = false
    container_configuration {
      image_name        = var.docker_image_name
      registry_url      = "https://index.docker.io"
      registry_username = var.docker_registry_username
      registry_password = var.docker_registry_password
    }
  }
}

