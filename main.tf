terraform {
  backend "gcs" {
    bucket = "patrick-agents-terraform-state"
    prefix = "demos/terraform-cloud-run-hello"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.0"
    }
  }
}

provider "google" {
  project = "patrick-agents-prod"
  region  = "us-central1"
}

resource "google_cloud_run_v2_service" "hello" {
  name                = "terraform-hello"
  location            = "us-central1"
  deletion_protection = false

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  }
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  project  = google_cloud_run_v2_service.hello.project
  location = google_cloud_run_v2_service.hello.location
  name     = google_cloud_run_v2_service.hello.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = google_cloud_run_v2_service.hello.uri
}
