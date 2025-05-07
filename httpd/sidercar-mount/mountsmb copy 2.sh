mkdir -p /opt/http-config-file
if [ ! -d "/etc/smbcredentials" ]; then
mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/httpconfig.cred" ]; then
    bash -c 'echo "username=httpconfig" >> /etc/smbcredentials/httpconfig.cred'
    bash -c 'echo "password=" >> /etc/smbcredentials/httpconfig.cred'
fi
chmod 600 /etc/smbcredentials/httpconfig.cred

bash -c 'echo "//httpconfig.file.core.windows.net/http-config-file /opt/http-config-file cifs nofail,credentials=/etc/smbcredentials/httpconfig.cred,dir_mode=0755,file_mode=0755,serverino,nosharesock,mfsymlinks,actimeo=30" >> /etc/fstab'
mount -t cifs //httpconfig.file.core.windows.net/http-config-file /opt/http-config-file -o vers=3.1.1,credentials=/etc/smbcredentials/httpconfig.cred,dir_mode=0755,file_mode=0755,serverino,nosharesock,mfsymlinks,actimeo=30

while [ true ]
do
    echo "Config directory:"
    ls -al /opt/http-config-file
    cat /opt/http-config-file/redirect.conf
    sleep 1m
done