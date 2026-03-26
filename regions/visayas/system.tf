# Set the Hostname
resource "fortios_system_global" "settings" {
  hostname = "Visayas-Hub-FW"
  timezone = "55" # 55 is the FortiOS ID for Asia/Manila (PHT)
}

# Set DNS to public resolvers (can be changed to PLDT/Globe later)
resource "fortios_system_dns" "dns_settings" {
  primary   = "8.8.8.8"
  secondary = "1.1.1.1"
}
