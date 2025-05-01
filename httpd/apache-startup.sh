#!/bin/bash
echo "Http start"
rm -rf /usr/local/apache2/conf/redirect/redirect.conf
while [ ! -e  "/usr/local/apache2/conf/redirect/redirect.conf" ]
do
  echo "Waiting for config ready"
  ls -al /usr/local/apache2/conf/redirect
  sleep 10s
done
echo "config is ready, starting the server"
ls -al /usr/local/apache2/conf/redirect
/usr/local/bin/httpd-foreground