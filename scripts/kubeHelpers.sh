#!/bin/bash

k_ctx() {
  if [ -z "$1" ]; then
    echo "Usage: k_ctx <namespace>"
    echo "Available namespaces:"
    kubectl get ns --no-headers -o custom-columns=":metadata.name"
    return 1
  fi

  kubectl config set-context --current --namespace="$1"
  echo "Now using namespace '$1'"
}
