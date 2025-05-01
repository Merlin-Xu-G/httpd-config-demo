#!/bin/bash
# while [ ! -e  "/usr/local/apache2/conf/redirect/redirect.conf" ]
# do
#   ls -al /usr/local/apache2/conf/redirect
#   echo "Waiting for config ready"
#   sleep 1m
# done
sleep 1m
echo "config ready"
ls -al /usr/local/apache2/conf/redirect
cat /usr/local/apache2/conf/redirect/redirect.conf
exec httpd-foreground