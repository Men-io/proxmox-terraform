resource "proxmox_virtual_environment_vm" "talos_vm" {
  for_each = { for vm in var.vm_configs : vm.vm_id => vm }

  name        = each.value.name
  description = "Managed by Terraform"
  tags        = each.value.tags

  node_name = "thor"
  vm_id     = each.value.vm_id

  cdrom {
    file_id = "local:iso/talos_v1.9.3.iso"
  }

  agent {
    enabled = false
  }

  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores = each.value.cpu_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = each.value.memory_size
    floating  = each.value.memory_size
  }

  disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    interface    = "scsi0"
    size         = each.value.disk_size
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
