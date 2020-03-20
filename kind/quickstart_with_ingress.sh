#!/usr/bin/env bash
set -euo pipefail

# Get kind
test -f ~/bin/kind || \
  curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64" \
  && chmod +x ./kind \
  && mv ./kind ~/bin

# Create a cluster
kind create cluster --config=config.yaml

# Apply the mandatory ingress-nginx components
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml

# Apply kind specific patches to forward the hostPorts to the ingress controller, set taint tolerations and schedule it to the custom labelled node.
kubectl patch deployments -n ingress-nginx nginx-ingress-controller -p '{"spec":{"template":{"spec":{"containers":[{"name":"nginx-ingress-controller","ports":[{"containerPort":80,"hostPort":80},{"containerPort":443,"hostPort":443}]}],"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

# Expose the nginx service using NodePort.
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/baremetal/service-nodeport.yaml


# Test ingress
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml && sleep 10
## should output "foo"
curl localhost/foo
## should output "bar"
curl localhost/bar
