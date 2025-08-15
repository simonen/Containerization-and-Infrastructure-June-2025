# Dockerfile
FROM almalinux

RUN dnf install -y httpd && \
    dnf clean all

COPY web/index.html /var/www/html

EXPOSE 80

CMD ["httpd", "-DFOREGROUND"]