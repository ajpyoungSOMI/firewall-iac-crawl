terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.16.0" # Minimum version for v7.0.x features
    }
  }
}

provider "fortios" {
  hostname = var.fgt_ip
  token    = var.fgt_token
  insecure = true # Set to true because our EVE-NG lab uses a self-signed certificate
}
