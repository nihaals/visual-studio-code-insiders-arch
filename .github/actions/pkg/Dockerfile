FROM archlinux:latest

COPY build.sh /build.sh
RUN /build.sh && rm /build.sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
