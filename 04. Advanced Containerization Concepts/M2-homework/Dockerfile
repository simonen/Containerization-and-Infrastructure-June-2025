# ---------- Build stage ----------
FROM almalinux:9-minimal AS builder

# Install Apache in the builder stage
RUN microdnf install -y dnf && \
    dnf install -y httpd && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# ---------- Runtime stage ----------
FROM almalinux:9-minimal

# Copy only the necessary binaries, configs, and modules
COPY --from=builder /usr/sbin/httpd /usr/sbin/
COPY --from=builder /usr/lib64/httpd /usr/lib64/httpd
COPY --from=builder /etc/httpd /etc/httpd
COPY --from=builder /var/www /var/www
COPY --from=builder /usr/lib64/libapr* /usr/lib64/
COPY --from=builder /usr/lib64/libhttpd* /usr/lib64/
COPY --from=builder /usr/lib64/libpcre* /usr/lib64/
COPY --from=builder /usr/lib64/libnghttp2* /usr/lib64/
COPY --from=builder /usr/lib64/liblua* /usr/lib64/
COPY --from=builder /usr/lib64/libssl* /usr/lib64/
COPY --from=builder /usr/lib64/libcrypto* /usr/lib64/
COPY --from=builder /usr/lib64/libexpat* /usr/lib64/

# Apache listens on port 80
EXPOSE 80

# Run Apache in the foreground
CMD ["httpd", "-DFOREGROUND"]
