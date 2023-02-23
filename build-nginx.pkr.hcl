build {
  sources = [
    "source.amazon-ebs.nginx-ami"
  ]

  provisioner "shell" {
    inline = [
      "echo Updating Packages",
      "sudo apt update"
    ]
  }

  provisioner "breakpoint" {
    disable = false
    note    = "Install Nginx"
  }

  provisioner "shell" {
    inline = ["sudo apt install -y nginx"]
  }
  provisioner "breakpoint" {
    disable = false
    note    = "Check Nginx service is running"
  }

  provisioner "shell" {
    inline = ["sudo systemctl status nginx"]
  }

  post-processor "manifest" {
    output = "nginx-manifest.json"
  }
}
