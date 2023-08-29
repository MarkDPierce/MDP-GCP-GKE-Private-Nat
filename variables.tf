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

variable "credentials_file_en" {
  type        = string
  description = "Only use if you have a SOPS encrypted creds.json file. If you dont use SOPS to encrypt use the other var for plain text."
  default     = "creds.json"
}

variable "credentials_file" {
  type        = string
  description = "If you generated a plain text json key for your service account."
  default     = ""
}

variable "workcidr" {
  type        = string
  description = "The CIDR range for your office/vpn in order to access the GKE cluster."
}

variable "firewall_source_ranges" {
  type    = list(string)
  default = ["0.0.0.0/32"]
}
