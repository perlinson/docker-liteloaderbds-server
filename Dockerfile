FROM alpine:latest

COPY scripts /scripts
RUN /scripts/build.sh

WORKDIR /data
ENTRYPOINT [ "/scripts/entrypoint.sh" ]
