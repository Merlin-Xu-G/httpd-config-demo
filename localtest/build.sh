#!/bin/bash
echo "\$1:$1"
if [[ -z "$1" ]]; then
  echo "please input the image tag"
  exit 1
fi

cd ..
project_path=$(pwd)
cd $project_path/httpd/sidecar
sudo docker build . -t merlintestcontainerregistry1.azurecr.io/testsamba:$1
cd $project_path/httpd
sudo docker build . -t merlintestcontainerregistry1.azurecr.io/httpd-demo:$1
