# Basic Outbound Internet Access Policy
resource "fortios_firewall_policy" "lan_to_internet" {
  policyid = 1
  name     = "Visayas-Outbound-Internet"
  action   = "accept"
  schedule = "always"
  nat      = "enable"

  # Where traffic enters and leaves
  srcintf {
    name = fortios_system_interface.lan.name
  }
  dstintf {
    name = fortios_system_interface.wan1.name
  }

  # What traffic is allowed
  srcaddr {
    name = fortios_firewall_address.visayas_core_lan.name
  }
  dstaddr {
    name = "all" # Built-in FortiOS object for 0.0.0.0/0
  }
  service {
    name = "ALL" # Built-in FortiOS object for all ports/protocols
  }

  # Security Profiles (Assuming default profiles exist in v7.0.5)
  utm_status = "enable"
  ssl_ssh_profile {
    name = "certificate-inspection"
  }
  av_profile {
    name = "default"
  }
}
