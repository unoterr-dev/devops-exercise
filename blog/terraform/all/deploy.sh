IMAGE="c97151a"
HOST="35.228.181.33"
NAME=""
USER=""
PASS=""
envsubst < blog.yaml > blog_tmp.yaml
kubectl apply -f blog_tmp.yaml