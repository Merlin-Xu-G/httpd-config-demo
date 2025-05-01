FROM ubuntu:24.04
RUN  apt update && apt upgrade -y
RUN apt install -y samba cifs-utils rsync
COPY ./mountsmb.sh /mountsmb.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x /mountsmb.sh
COPY sshd_config /etc/ssh/

EXPOSE 2222

CMD /mountsmb.sh 