FROM almalinux:10

RUN dnf update -y && \
        dnf install -y httpd && \
        dnf clean all && \
        rm -rf /usr/local/apache2/htdocs/index.html

COPY httpd-foreground /usr/local/bin

RUN chmod +x /usr/local/bin/httpd-foreground

COPY web/index.html /var/www/html

EXPOSE 80

CMD ["httpd-foreground"]