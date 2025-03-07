# Define the resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.labelPrefix}-A05-RG"
  location = var.region
}


# Define the virtual machine
resource "azurerm_linux_virtual_machine" "webserver" {
    name                  = "${var.labelPrefix}A05VM"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  network_interface_ids = [azurerm_network_interface.webserver.id]
  size                  = "Standard_B1s"

  os_disk {
    name                 = "${var.labelPrefix}A05OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
