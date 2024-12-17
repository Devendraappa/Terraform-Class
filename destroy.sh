#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "Initializing Terraform..."
terraform init

echo "Destroying Terraform-managed infrastructure..."
terraform destroy -auto-approve

echo "Terraform destroy completed successfully!"