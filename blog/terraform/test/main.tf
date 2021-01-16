  resource "null_resource" "apply" {
    provisioner "local-exec" {
        command = "gcloud container clusters describe terraform-cluster --zone='europe-north1'"
        interpreter = ["/bin/zsh", "-c"]
    } 
  }