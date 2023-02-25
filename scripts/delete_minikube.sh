#/bin/bash
# Work with minkube v1.29.0

PROFILE="dev"

minikube delete \
    --profile=${PROFILE}
