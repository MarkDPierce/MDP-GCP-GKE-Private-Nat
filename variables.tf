variable "project_id" {
  type = string
}

variable "region" {
  default = "europe-west4"
}

variable "zone" {
  default = "europe-west4-a"
}

variable "network_name" {
  default = "vpc-network2"
}

variable "subnet_name" {
  default = "subnet1-europe-west4-10"
}

variable "credentials" {
  type        = string
  description = ""
}

variable "workcidr" {
  type        = string
  description = "The CIDR range for your office/vpn in order to access the GKE cluster."
}
