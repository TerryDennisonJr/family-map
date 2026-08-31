# Setup

1. Setup google service account
2. Setup api key for service account
3. Create service account .json file
4. Download .json file
5. Share gsheet with service account
6. Fill in SA_FILE path Environment Variable for K8s
7. Build image

## Create Secret

```bash
kubectl create secret generic google-service-account -n family-map \
  --from-file=deployment/gcp_creds/gcp_service_account.json
```

## Create CronJob

```bash
helm install denn-mapy family-mapper 
```

## Manually Deploy Job from CronJob

```bash
kubectl create job --from=cronjob/family-mapper -n family-map gsheet-run-$(date +%Y%m%d)
```

## Teardown

```bash
sudo kubectl delete cronjob family-mapper -n family-map

sudo kubectl delete secret google-service-account -n family-map
```
