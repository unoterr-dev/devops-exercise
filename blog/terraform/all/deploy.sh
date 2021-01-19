IMAGE="c97151a"
HOST=$(terraform output -json | jq -r '.host.value')
NAME=$(terraform output -json | jq -r '.name.value')
USER=$(terraform output -json | jq -r '.user.value')
PASS=$(terraform output -json | jq -r '.pass.value')

envsubst < blog.yaml > blog_tmp.yaml
kubectl apply -f blog_tmp.yaml
kubectl apply -f service_blog.yaml
kubectl apply -f ingress.yaml