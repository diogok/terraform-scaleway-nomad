
variable "organization" {}
variable "token" {}

module "nomad" {
  #source="github.com/diogok/terraform-scaleway-nomad"
  source="../../"
  
  organization="${var.organization}"
  token="${var.token}"
  region="ams1"

  name="demo"

  manager_count=1
  worker_count=2

  changeme="${uuid()}"
}

output "managers" {
  value="${module.nomad.managers}"
}

output "workers" {
  value="${module.nomad.workers}"
}

