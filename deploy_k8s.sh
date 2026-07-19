#! /bin/bash

kubectl create secret generic google-service-account \
  --from-file=service_account.json=/Users/${USER}/.config/google/family-reunion-501301-ffed6c501490.json

kubectl apply -f deployment/deployment.yaml