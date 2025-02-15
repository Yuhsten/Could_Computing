# Declarative approach: Let the earth be like this. 

# We need a certain provider, which is google
terraform {}

provider "google" {
    project = "warm-rookery-449616-f8" # Own project ID
    region = "us-central1-a"
}

# We give the bucket a name and create Google Cloud Storage bucket
resource "google_compute_instance" "vm_instance" {
    name = "student-vm" # Ensure unique ID
    machine_type = "e2-medium"
    zone = "europe-west1-b"
  
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  network_interface {
    
    network = "default"
    access_config {} # Enables external access optional
      
    }
  }
  
# Define a output variable bucket_name
output "vm_external_ip" {
    value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
    }


