# Terraform Cloud Run hello world

A tiny Infrastructure-as-Code demo: pushing to `main` makes GitHub Actions use
keyless Google Cloud authentication, run Terraform, deploy Google's public
Hello container to Cloud Run, and curl the resulting URL.

The Terraform state lives in the existing `patrick-agents-terraform-state`
bucket under `demos/terraform-cloud-run-hello`.
