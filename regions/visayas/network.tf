# Visayas LAN Interface (Mapping to physical FG-71G Port 2)
resource "fortios_system_interface" "lan" {
  name        = "port2"
  vdom        = "root"
  ip          = "10.0.1.254 255.255.255.0"
  allowaccess = "ping"
  alias       = "Visayas-LAN"
  role        = "lan"
}

# Visayas WAN Interface (Mapping to physical FG-71G Port 9 / WAN1)
resource "fortios_system_interface" "wan1" {
  name        = "port9"
  vdom        = "root"
  mode        = "dhcp" # Assuming EVE-NG Cloud0 provides DHCP for internet access
  allowaccess = "ping"
  alias       = "PLDT-Fiber-WAN1"
  role        = "wan"
}

# Default Route (0.0.0.0/0 out of WAN1)
# Note: If WAN is DHCP, FortiOS usually adds a default route automatically. 
