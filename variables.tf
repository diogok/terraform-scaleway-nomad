
variable "organization" {
  description="You scaleway access token."
}

variable "token" {
  description="You scaleway generated token."
}

variable "region" {
  description="The region where to create your instances."
  default="par1"
}

variable "type" {
  description="The machine type to create the instances."
  default="VC1S"
}

variable "arch" {
  description="The machine type archtecture."
  default="x86_64"
}

variable "name" {
  description="The name of your cluster, used for identification and to separate different clisters."
  default="MyService"
}

variable "tags" {
  description="Tags to add to your instances."
  default=[]
}

variable "manager_count" {
  description="Number of managers to create."
  default=1
}

variable "worker_count" {
  description="Number of workers to create."
  default=3
}

variable "additional_volume" {
  description="If we should attach additional volume to instance"
  default=true
}

variable "additional_volume_size" {
  description="Size of an additional volume to attach to the instances."
  default="50"
}

variable "security_group" {
  description="Security group to add instances to."
  default=""
}

variable "changeme" {
  description="Provoke re-provision"
  default=""
}
