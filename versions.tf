terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.78.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }

  required_version = "~> 1.5.0"
}

provider "google" {
  # If you provide a sops encrypted credential file
  # That will be used. Otherwise, it will use a non
  # encrypted version of your creds.json file
  credentials = var.credentials_file_en != "" ? data.sops_file.creds.raw : var.credentials_file
}

data "sops_file" "creds" {
  source_file = var.credentials_file_en
}
