variable "pm_password" {
  type        = string
  description = "value of the password"
}

variable "vm_configs" {
  description = "List of VM configurations"
  type = list(object({
    name        = string
    vm_id       = number
    tags        = list(string)
    cpu_cores   = number
    memory_size = number
    disk_size   = string
  }))
  default = [
    {
      name        = "talos-vm-1"
      vm_id       = 501
      tags        = ["terraform", "talos", "vm1"]
      cpu_cores   = 1
      memory_size = 2048
      disk_size   = "64"
    },
    {
      name        = "talos-vm-2"
      vm_id       = 502
      tags        = ["terraform", "talos", "vm2"]
      cpu_cores   = 1
      memory_size = 2048
      disk_size   = "64"
    },
    {
      name        = "talos-vm-3"
      vm_id       = 503
      tags        = ["terraform", "talos", "vm3"]
      cpu_cores   = 1
      memory_size = 2048
      disk_size   = "64"
    }
  ]
}

