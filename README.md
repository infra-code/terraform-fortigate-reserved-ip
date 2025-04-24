# terraform-fortigate-reserved-ip

Custom Terraform module for creating static IP in Fortigate Firewall

## Example Usage

```
# Will generate a new mac address
module "ip" {
  source = "github.com/lee5i3/terraform-fortigate-reserved-ip"
  
  name       = "my ip"
  ip_address = "192.168.10.1"
}

# Specify a mac address
module "ip" {
  source = "github.com/lee5i3/terraform-fortigate-reserved-ip"
  
  name        = "my ip"
  ip_address  = "192.168.10.1"
  mac_address = "00:1A:2B:3C:4D:5E"
}

```