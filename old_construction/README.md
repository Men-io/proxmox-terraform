# proxmox-terraform
homelab, provisioning Talos VM's

First up i setup an .envrc to expose my credentials for my local proxmox server

```bash
export TF_VAR_pm_password=[YOUR_PASSWORD]
```

Next up i made sure to use the correct provider which is also supported by terraform itself

```bash
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.71.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://YOURIP:8006" #use you domain name or local ip to connect
  username = "root@pam" #default user is root
  password = var.pm_password
  insecure = true
}
```

The docs I used here was [Proxmox Terraform Official Documentation](https://registry.terraform.io/providers/bpg/proxmox/0.71.0)

Then I made sure to download the correct ISO file from Talos with QEMU support added

factory image with qemu:

```bash
 customization:
     systemExtensions:
         officialExtensions:
             - siderolabs/qemu-guest-agent
```

[Factory image Talos](https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/v1.9.3/metal-amd64.iso)

See talos-iso.tf file for more info. 

And then we created the VM. Please note! Make sure to change the disks and network to your own device. 

Further variables and automate creating multiple machines, still in progress. 