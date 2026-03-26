# Define the Visayas Core Subnet
resource "fortios_firewall_address" "visayas_core_lan" {
  name    = "NET-Visayas-10.0.1.0-24"
  type    = "ipmask"
  subnet  = "10.0.1.0 255.255.255.0"
  comment = "Managed by Terraform: Main Visayas Office Subnet"
}

# Define a specific server group
resource "fortios_firewall_address" "local_ad_server" {
  name    = "SRV-Visayas-AD-01"
  type    = "ipmask"
  subnet  = "10.0.1.10 255.255.255.255"
  comment = "Managed by Terraform: Active Directory Server"
}
