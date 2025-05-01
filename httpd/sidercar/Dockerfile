FROM ubuntu:24.04
RUN apt update && apt upgrade -y
RUN apt install -y smbclient
COPY ./setup-redirect-set.sh /opt/setup-redirect-set.sh

CMD /opt/setup-redirect-set.sh