FROM httpd

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY html /usr/local/apache2/htdocs
COPY apache-startup.sh /usr/local/apache2/apache-startup.sh

CMD [ "/usr/local/apache2/apache-startup.sh" ]
ENTRYPOINT [ "bash", "-c" ]