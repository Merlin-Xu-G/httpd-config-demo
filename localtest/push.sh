#!/bin/bash
echo "\$1:$1"
if [[ "$1" == "" ]]; then
  echo "please input the image tag"
  exit 1
fi

sudo docker push merlintestcontainerregistry1.azurecr.io/testsamba:$1
sudo docker push merlintestcontainerregistry1.azurecr.io/httpd-demo:$1
