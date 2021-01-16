  provisioner "local-exec" {
    command = "gcloud container clusters describe ${google_container_cluster.primary.name} --zone=${google_container_cluster.primary.location}"
    interpreter = ["/bin/zsh", "-c"]
  } 