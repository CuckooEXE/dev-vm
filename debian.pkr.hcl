variable "disk_size" {
  type    = string
  default = "4G"
}

variable "image_name" {
  type   = string
  default = "debian-13-genericcloud-amd64-daily.qcow2"
}

variable "iso_base_url" {
  type    = string
  default = "https://cdimage.debian.org/cdimage/cloud/trixie/daily/latest"
}

source "qemu" "debian" {
  boot_wait        = "5s"
  disk_compression = true
  disk_image       = true
  disk_interface   = "virtio"
  disk_size        = "${var.disk_size}"
  format           = "qcow2"
  headless         = true
  http_content     = {
     "/cloud-init/user-data" = file("${path.root}/http/cloud-init/user-data")
     "/cloud-init/meta-data" = file("http/cloud-init/meta-data")
  }
  iso_checksum     = "file:${var.iso_base_url}/SHA512SUMS"
  iso_url          = "${var.iso_base_url}/${var.image_name}"
  net_device       = "virtio-net"
  qemuargs         = [["-smbios", "type=1,serial=ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/cloud-init/"]]
  shutdown_command = "echo packer | sudo systemctl poweroff"
  ssh_password     = "password"
  ssh_port         = 22
  ssh_timeout      = "5m"
  ssh_username     = "user"
  vm_name          = "dev-vm.qcow2"
}

build {
  sources = ["source.qemu.debian"]
    provisioner "shell" {
      scripts = [
        "scripts/git-clone.sh",
        "scripts/install.sh",
      ]
    }
}