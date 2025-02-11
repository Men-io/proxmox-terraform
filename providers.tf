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
    flux = {
      source  = "fluxcd/flux"
      version = "1.4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.27"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.1"
    }
  }
}

provider "proxmox" {
  endpoint = "https://YOURIP:8006"
  insecure = true
}

provider "flux" {
  kubernetes = {
    config_path = "~/.kube/ragnarok_config"
  }
  git = {
    url = "https://github.com/Men-io/proxmox-terraform.git"
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/ragnarok_config"
  }
}

provider "github" {
  owner = var.github_org
  token = var.github_token
}

provider "kubernetes" {
  config_path = "~/.kube/ragnarok_config"
}
