terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.78.0"
    }
  }

  required_version = "~> 1.5.0"
}

provider "google" {
  credentials = file(var.credentials)
}