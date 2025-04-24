#--------------------------------------------------------------
# Network Variables
#--------------------------------------------------------------
variable "name" {
  description = "The name of the ip address"
  type        = string
}

variable "interface_id" {
  description = "The interface to be used"
  type        = string
  default     = "1"
}

variable "ip_address" {
  description = "The IP address to be used"
  type        = string
}

variable "mac_address" {
  description = "The MAC address to be used"
  type        = string
  default     = ""
}
