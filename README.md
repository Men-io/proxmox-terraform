# **Proxmox, Talos, and Cilium in My Homelab**  

This repository documents the setup of my **homelab environment**, where I repurposed an **old MacBook** as a **Proxmox** server.  

## **Hardware Specifications**  
- **CPU**: 4 cores  
- **RAM**: 8 GB  
- **Storage**: 1 TB  

## **Proxmox Installation**  

### **1. Downloading Proxmox**  
I installed **Proxmox VE 8.3**, which can be downloaded from the official site:  
👉 [Proxmox Downloads](https://proxmox.com/en/downloads)  

### **2. Creating a Bootable USB**  
To create a bootable Proxmox USB, I used **[Balena Etcher](https://etcher.balena.io/)**.  

1. Download the latest **Proxmox ISO**.  
2. Use **Balena Etcher** to flash the ISO onto a USB drive.  
3. Insert the USB into the **MacBook** and reboot.  

### **3. Booting from USB**  
Since MacBooks use **EFI boot**, press **`ALT (Option)`** while starting up to select the **USB device** as the boot source.  

### **4. Installing Proxmox**  
Follow the **installation wizard** to complete the setup. The default settings work fine for most cases.  

## **Post-Installation Configuration**  
After installation, I ran a **post-install script** from the **Proxmox Community Scripts** to remove the **subscription pop-ups**:  

🔗 [Proxmox Community Scripts](https://community-scripts.github.io/ProxmoxVE/scripts?id=post-pve-install)  

This ensures a smoother experience without unnecessary license warnings.  

---

## **Next Steps**  
After setting up **Proxmox**, the next steps involve configuring **Talos Linux**, deploying **Cilium** for networking, and setting up **Proxmox VMs** with **Terraform**.

# **Terraform Providers**

First, we define the components we wish to set up. In this use case, we will deploy **Talos Linux** on one control plane node and two worker nodes, using **Cilium** as the CNI.

To achieve this, we need to configure two providers: **Talos** and **Proxmox**. Below is the provider setup:

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.71.0"
    }
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
  }
}
```

After adding the above configuration to your **terraform** files, initialize the providers using the following command:

```bash
terraform init
```
## Authentication with Proxmox
To authenticate with your Proxmox server, add the following provider configuration:

```hcl
provider "proxmox" {
  endpoint = "https://YOURIP:8006"
  insecure = true
}
```
## Environment Variables
For secure authentication, I recommend using **direnv**. Create a .envrc file with the following content (but ensure you don't push these credentials to your repository):

```bash
export PROXMOX_VE_USERNAME=root@pam
export PROXMOX_VE_PASSWORD=<your proxmox password>
```
## .gitignore Configuration
To prevent sensitive data from being pushed to your Git repository, use a **.gitignore** file containing the following entries:

```bash
.envrc
.terraform
.terraform.lock.hcl
terraform.tfstate
terraform.tfstate.backup
```

$ terraform output -raw kubeconfig
$ terraform output -raw talosconfig

## External Resources
The following resources were essential in making this setup possible:

- [olav.ninja](https://olav.ninja/talos-cluster-on-proxmox-with-terraform)
- [talos.dev](https://www.talos.dev/v1.9/kubernetes-guides/network/deploying-cilium/)
- [terraform](https://registry.terraform.io/providers/siderolabs/talos/latest/docs/resources/machine_configuration_apply)

## Adding Flux
Docs will follow