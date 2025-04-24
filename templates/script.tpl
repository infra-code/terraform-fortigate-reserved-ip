config system dhcp server
  edit ${interface_id}
    config reserved-address
      edit ${unique_id}
        set ip ${ip_address}
        set mac ${mac_address}
        set description "Created with Terraform"
      next
    end
  next
end