variable "fgt_ip" {
  description = "The Management IP of the EVE-NG Visayas FortiGate"
  type        = string
}

variable "fgt_token" {
  description = "The REST API Token generated on the FortiGate"
  type        = string
  sensitive   = true # Hides it from console output
}
