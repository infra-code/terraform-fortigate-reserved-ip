#--------------------------------------------------------------
# Resource: Mac Address
# Purpose: Generate a random MAC address
#--------------------------------------------------------------
resource "macaddress" "this" {
  count = var.mac_address == "" ? 1 : 0
}

#--------------------------------------------------------------
# Resource: FortiOS System Autoscript
# Purpose: Create a FortiOS system autoscript to reserve an IP address
#--------------------------------------------------------------
resource "fortios_system_autoscript" "ip" {

  interval    = 1
  name        = var.name
  output_size = 10
  repeat      = 1
  start       = "auto"

  script = templatefile("${local.template_dir}/script.tpl", {
    interface_id = var.interface_id
    unique_id    = replace(var.ip_address, ".", "")
    ip_address   = var.ip_address
    mac_address  = var.mac_address == "" ? macaddress.this[0].address : var.mac_address
  })
}
