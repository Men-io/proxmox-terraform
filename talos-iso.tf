resource "proxmox_virtual_environment_download_file" "talos_1_9_3_iso" {
  content_type = "iso"
  datastore_id = "local"
  file_name    = "talos_v1.9.3.iso"
  node_name    = "thor"
  url          = "https://factory.talos.dev/image/ce4c980550dd2ab1b17bbf2b08801c7eb59418eafe8f279833297925d67c7515/v1.9.3/metal-amd64.iso"
}
