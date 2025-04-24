#--------------------------------------------------------------
# Resource: IP Address
# Purpose: Returns the IP Address
#--------------------------------------------------------------
output "ip_address" {
  value = var.ip_address
}

#--------------------------------------------------------------
# Resource: Mac Address
# Purpose: Returns the MAC Address
#--------------------------------------------------------------
output "mac_address" {
  value = var.mac_address == "" ? macaddress.this[0].address : var.mac_address
}
