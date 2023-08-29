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
  # For the purpose of these files this is good enough
  # Generating a Json key is generally not recommended
  credentials = data.sops_file.creds.raw
}

data "sops_file" "creds" {
  source_file = "./creds.json"
}
