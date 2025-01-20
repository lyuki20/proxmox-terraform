resource "proxmox_vm_qemu" "simple_vm" {
  target_node = "your-proxmox-node"
  vmid        = 900
  name        = "terraform-test"
  clone       = "ubuntu-2404-template-5"
  onboot      = true
  memory      = 4096
  cores       = 2

  network {
    id     = 0
    model  = "virtio" 
    bridge = "vmbr0"
  }

  disk {
    slot    = "scsi0"        
    type    = "disk"         
    storage = "local-lvm"    
    size    = "10G"         
  }
}
