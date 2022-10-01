hostname="api.dev.dapb6.com"
tenant="api"
chart="../helm/dap-api"
imageName="dapreg.azurecr.io/dap/api" # per azure ACR
imageTag="latest" 

helm install $tenant $chart \
--create-namespace \
--namespace $tenant \
--set image.repository=$imageName \
--set image.tag=$imageTag \
--set nameOverride=$tenant \
--set ingress.hosts[0].host=$hostname \
--set ingress.tls[0].hosts[0]=$hostname \
--dry-run --debug > dap-api-dry-run.yaml