
output "managers" {
  description="Public IPs of the managers"
  value=["${scaleway_ip.managers.*.ip}"]
}

output "workers" {
  description="Public IPs of the workers"
  value=["${scaleway_ip.workers.*.ip}"]
}

