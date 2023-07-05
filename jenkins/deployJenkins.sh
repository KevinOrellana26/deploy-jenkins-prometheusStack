#!/bin/bash
# Inicialize terraform
terraform init

# Plan terraform
terraform plan

# Apply terraform automatically
terraform apply -auto-approve