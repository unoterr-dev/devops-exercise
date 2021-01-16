  resource "null_resource" "apply" {
    provisioner "local-exec" {
        command = "./usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/gcloud container clusters describe terraform-cluster --zone='europe-north1'"
     //   interpreter = ["/bin/zsh", "-c"]
    } 
  }