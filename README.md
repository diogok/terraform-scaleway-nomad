# Terraform Scaleway Nomad Module

This module creates a nomad cluster on Scaleway.

## Dependencies

Minimal versions:

- Terraform 0.11.7
- A scaleway account

## Usage

Example usage of the module.

```
# scaleway access variables
variable "organization" {}
variable "token" {}

module "nomad" {
  source="github.com/diogok/terraform-scaleway-nomad" 

  name="demo"

  manager_count=1
  worker_count=3
  
  organization="${var.organization}"
  token="${var.token}"
}

output "managers" {
  value="${module.nomad.managers}"
}

output "workers" {
  value="${module.nomad.workers}"
}

```

## License

MIT

