terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.71.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://YOURIP:8006"
  username = "root@pam"
  password = var.pm_password
  insecure = true
}
