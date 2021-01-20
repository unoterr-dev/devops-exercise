export IMAGE="c97151a"
export HOST=$(terraform output -json | jq -r '.host.value')
export NAME=$(terraform output -json | jq -r '.name.value')
#export USER=$(terraform output -json | jq -r '.user.value')
#export PASS=$(terraform output -json | jq -r '.pass.value')

envsubst < blog.yaml > blog_tmp.yaml
kubectl apply -f blog_tmp.yaml
kubectl apply -f service_blog.yaml
kubectl apply -f ingress.yaml