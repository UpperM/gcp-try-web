// Configure the Google Cloud provider
provider "google" {
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

resource "google_compute_instance" "instance" {
  for_each = {for instance in var.instances:  instance.hostname => instance}
  name = "${each.value.hostname}"
  machine_type              = var.instance_type
  project                   = var.gcp_project
  zone                      = var.gcp_zone
  tags = ["backend"]
  scheduling {
    preemptible       = true
    automatic_restart = false
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
      type  = "pd-standard"
    }
  }
  network_interface {
    network = "${each.value.network}"
    subnetwork = "web-subnetwork"
    access_config {
      // Include this section to give the VM an external ip address
    }
  }
      metadata_startup_script = "${each.value.startup_script}"
    allow_stopping_for_update = true
}
