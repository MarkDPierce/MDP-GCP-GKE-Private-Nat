module "cloud-nat" {
  source       = "./modules/cloud-nat"
  network_name = var.network_name
  region       = var.region
  subnet_name  = var.subnet_name
  project_id   = var.project_id
}

resource "google_container_cluster" "primary" {
  project            = var.project_id
  name               = "nat-cluster"
  location           = var.zone
  initial_node_count = 4
  network            = module.cloud-nat.network.id
  subnetwork         = module.cloud-nat.subnet.id

  private_cluster_config {
    master_ipv4_cidr_block  = "172.16.0.16/28"
    enable_private_endpoint = false
    enable_private_nodes    = true
    #cluster_ipv4_cidr  = "10.0.32.0/20"

    master_global_access_config {
      enabled = false
    }
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.0.32.0/20"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.workcidr
      display_name = "work-network"
    }
  }
  resource_labels = {
    "environment" = "sandbox"
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }

    http_load_balancing {
      disabled = true
    }

    network_policy_config {
      disabled = true
    }
  }
  default_snat_status {
    disabled = true
  }
}

resource "google_compute_firewall" "rules" {
  project = var.project_id
  name    = "allow-ssh"
  network = module.cloud-nat.network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}