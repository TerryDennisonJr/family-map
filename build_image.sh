#! /bin/bash

echo "Setting up Envars..."
sleep 3

export APP_ENV=local
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/google/family-reunion-501301-ffed6c501490.json

docker buildx build \
  --platform linux/amd64 \
  -t infinitiq502004/family-map:1.1.6 \
  --push -f deployment/Dockerfile .

docker push infinitiq502004/family-map:1.1.6