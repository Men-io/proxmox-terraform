
variable "cluster_name" {
  type    = string
  default = "ragnarok"
}

variable "default_gateway" {
  type    = string
  default = "YOUR_IP_ADDRESS"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "YOUR_IP_ADDRESS"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "YOUR_IP_ADDRESS"
}

variable "talos_worker_02_ip_addr" {
  type    = string
  default = "YOUR_IP_ADDRESS"
}

variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "Men-io"
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = "flux"
}
