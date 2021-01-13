1. Changed the paths to build files in Dockerfile to fit the Jenkins Pipeline environment.
2. All envs are moved to Secrets.
3. Image can be either pushed to DockerHub or be used localy by
                ~~adding line imagePullPolicy: Never in blog.yaml.~~
                creating a local registry on localhost:5000.

4. Minikube is started manually, not via Jenkins file.
    Also are PG deployment and corresponding services. 

5. Hmmmm
