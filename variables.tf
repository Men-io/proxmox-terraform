
variable "cluster_name" {
  type    = string
  default = "ragnarok"
}

variable "default_gateway" {
  type    = string
  default = "192.168.178.1"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "192.168.178.41"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "192.168.178.42"
}
