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

  # ADD THIS CORRECTED FORMAT:
  utm_status      = "enable"
  profile_type    = "single"                   # Tells FortiOS we are assigning individual profiles
  ssl_ssh_profile = "certificate-inspection"   # Argument format (String)
  av_profile      = "default"                  # Argument format (String)
}
