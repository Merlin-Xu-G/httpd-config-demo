#!/bin/bash

# mount redirect set config
export REDIRECT_SET_MOUNT="/opt/http-config-file-mount"
export REDIRECT_SET_LOCAL="/opt/http-config-file-local"
mkdir -p "$REDIRECT_SET_MOUNT"
if [ ! -d "/etc/smbcredentials" ]; then
mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/httpconfig.cred" ]; then
    bash -c 'echo "username=httpconfig" >> /etc/smbcredentials/httpconfig.cred'
    bash -c 'echo "password=oLdDlY9JOJ88tcZBSpVPQD76giCN3N15Vn+EwXHikMiYNMsl9mQzt53ZBNWZ8FqZSkf3ZEiw1S2y+AStFIeYqw==" >> /etc/smbcredentials/httpconfig.cred'
fi
chmod 600 /etc/smbcredentials/httpconfig.cred

echo "-------------------------------mount"
bash -c "echo \"//httpconfig.file.core.windows.net/http-config-file $REDIRECT_SET_MOUNT cifs nofail,credentials=/etc/smbcredentials/httpconfig.cred,dir_mode=0755,file_mode=0755,serverino,nosharesock,mfsymlinks,actimeo=30\" >>   "
mount -t cifs //httpconfig.file.core.windows.net/http-config-file $REDIRECT_SET_MOUNT -o vers=3.1.1,credentials=/etc/smbcredentials/httpconfig.cred,dir_mode=0755,file_mode=0755,serverino,nosharesock,mfsymlinks,actimeo=30
echo "-------------------------------mount end"

while [ true ]
do
    echo "Config mount directory:"
    ls -al "$REDIRECT_SET_MOUNT"
    cat "$REDIRECT_SET_MOUNT/redirect.conf"

    echo "Sync mount directory to local volume:"
    rsync -av "$REDIRECT_SET_MOUNT/" "$REDIRECT_SET_LOCAL/"
    ls -al "$REDIRECT_SET_LOCAL"
    cat "$REDIRECT_SET_LOCAL/redirect.conf"
    sleep 1m
done