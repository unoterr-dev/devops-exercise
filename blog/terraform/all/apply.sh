#!/bin/zsh

image=c97151a
terraform init -input=false
terraform plan -input=false -out tfplan -var 'image=${image}'

terraform apply -auto-approve tfplan
gcloud container clusters get-credentials terraform-cluster --zone=europe-north1

