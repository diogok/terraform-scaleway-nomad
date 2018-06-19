
provider "scaleway" {
  organization="${var.organization}"
  token="${var.token}"
  region="${var.region}"
}

data "scaleway_image" "debian" {
  architecture = "${var.arch}"
  name = "Debian Stretch"
}

data "scaleway_bootscript" "mainline" {
  architecture = "${var.arch}"
  name_filter  = "mainline 4.9.93"
}

resource "scaleway_ip" "managers" {
  count = "${var.manager_count}"
}

resource "scaleway_server" "managers" {
  depends_on=["scaleway_ip.managers"]

  count = "${var.manager_count}"

  name  = "${var.name} nomad manager ${count.index}"
  type  = "${var.type}"

  image = "${data.scaleway_image.debian.id}"
  bootscript = "${data.scaleway_bootscript.mainline.id}"

  enable_ipv6=true
  #dynamic_ip_required=true
  public_ip="${element(scaleway_ip.managers.*.ip,count.index)}"

  security_group="${var.security_group}"

  tags="${var.tags}"

  #TODO: Additional Volumes
}

resource "scaleway_ip" "workers" {
  count = "${var.worker_count}"
}

resource "scaleway_server" "workers" {
  depends_on=["scaleway_ip.workers"]

  count = "${var.worker_count}"

  name  = "${var.name} nomad worker ${count.index}"
  type  = "${var.type}"

  tags="${var.tags}"

  image = "${data.scaleway_image.debian.id}"
  bootscript = "${data.scaleway_bootscript.mainline.id}"

  enable_ipv6=true
  #dynamic_ip_required=true
  public_ip="${element(scaleway_ip.workers.*.ip,count.index)}"

  security_group="${var.security_group}"

  #TODO: Additional Volumes
}

module "nomad" {
  source="../terraform-debian-nomad"

  managers="${scaleway_server.managers.*.public_ip}"
  workers="${scaleway_server.workers.*.public_ip}"

  manager_count="${var.manager_count}"
  worker_count="${var.worker_count}"

  changeme="${var.changeme}"
}

