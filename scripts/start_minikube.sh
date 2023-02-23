#/bin/bash
# Work with minkube v1.29.0

PROFILE="dev"
N_NODE="1"
MEM="4G"
K8S_VERSION="1.26.1"

minikube start \
    --profile=${PROFILE} \
    --nodes=${N_NODE} \
    --memory=${MEM} \
    --kubernetes-version=${K8S_VERSION}
