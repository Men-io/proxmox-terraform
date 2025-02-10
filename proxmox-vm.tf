resource "proxmox_virtual_environment_vm" "talos_vm" {
  name        = "terraform-provider-proxmox-talos-vm"
  description = "Managed by Terraform"
  tags        = ["terraform", "talos"]

  node_name = "thor"
  vm_id     = 501

  cdrom {
    file_id = "local:iso/talos_v1.9.3.iso"
  }

  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = false
  }
  # if agent is not enabled, the VM may not be able to shutdown properly, and may need to be forced off
  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES" # recommended for modern CPUs
  }

  memory {
    dedicated = 2048
    floating  = 2048 # set equal to dedicated to enable ballooning
  }

  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "scsi0"
    size         = "64"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
