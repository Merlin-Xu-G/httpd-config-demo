#!/bin/bash
echo "Config sidecar start"
echo $ASC_KEY
rm -rf /opt/conf/*
while [ true ]
do
    if [ ! -e "/opt/conf/redirect.conf" ];then
        echo "Download redirect set config"
        smbclient //httpconfig.file.core.windows.net/http-config-file \
            -U httpconfig --password="$ASC_KEY" \
            -c "get redirect.conf /opt/conf/redirect.conf"
    else
        echo "ls the conf directory"
        ls -al /opt/conf
        cat /opt/conf/redirect.conf
        sleep 10s
    fi
done