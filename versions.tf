terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.55.0"
    }
  }

  required_version = "~> 1.3.0"
}

provider "google" {
  credentials = file(var.credentials)
}