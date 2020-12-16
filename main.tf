variable "server_count" {
  default = 99
}

variable "server_basename" {
  default = "test"
}

variable "server_domain" {
  default = "example.com"
}

locals {
  server_names = {
    for i in range(1, var.server_count + 1) :
    format("%s%02d.${var.server_domain}", var.server_basename, i) => format("%s%02d.${var.server_domain}", var.server_basename, i)
  }
}

output "server_names" {
  value = local.server_names
}
