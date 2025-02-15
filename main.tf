terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}

resource "google_storage_buckets" "example"{
    name = "my-terraform-bucket-12345"
    region = "us-west1"
    
    versioning {
        enabled = true
    }

    lables = {
        enviroment = "student-lab"
        managed_by = "terraform"
    }
}


provider "google" {
  project = "my-first-project-451009"
  region = "us-west1"
}

resource "google_storage_bucket" "mybucket" {
  name = "my-terraform-bucket-12345"
  location = "us-west1"
}

output "bucket_name" {
  value = google_storage_bucket.mybucket.name
}