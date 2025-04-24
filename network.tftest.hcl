variables {
  name = "test-ip"
}

mock_provider "fortios" {}

run "default" {
  variables {
    interface_id = "1"
    ip_address   = "192.168.100.13"
  }

  assert {
    condition     = output.ip_address == "192.168.100.13"
    error_message = "IP address should be provided"
  }

  assert {
    condition     = length(output.mac_address) > 0
    error_message = "MAC address should be generated"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "edit 1")
    error_message = "Missing interface id configuration"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "config reserved-address")
    error_message = "Missing config reserved-address configuration"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "set ip 192.168.100.13")
    error_message = "Missing ip address configuration"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "set mac ${output.mac_address}")
    error_message = "Missing mac address configuration"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "edit 19216810013")
    error_message = "Missing unique id configuration"
  }
}

run "custom_mac_address" {
  variables {
    interface_id = "1"
    ip_address   = "192.168.100.5"
    mac_address  = "00:11:22:33:44:55"
  }

  assert {
    condition     = output.ip_address == "192.168.100.5"
    error_message = "IP address should be provided"
  }

  assert {
    condition     = output.mac_address == "00:11:22:33:44:55"
    error_message = "MAC address should be provided"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "set ip 192.168.100.5")
    error_message = "Missing ip address configuration"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "set mac 00:11:22:33:44:55")
    error_message = "Missing mac address configuration"
  }
}

run "custom_interface_id" {
  variables {
    interface_id = "2024"
    ip_address   = "192.168.100.7"
  }

  assert {
    condition     = strcontains(fortios_system_autoscript.ip.script, "edit 2024")
    error_message = "Missing interface id configuration"
  }
}
