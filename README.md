# Terraform Cloud Run hello world

A tiny Infrastructure-as-Code demo: pushing to `main` makes GitHub Actions use
keyless Google Cloud authentication, restore the Terraform state cache, deploy
Google's public Hello container to Cloud Run, and curl the resulting URL.

The target GCP project must have active billing.
