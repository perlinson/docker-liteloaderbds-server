FROM alpine:latest
ENV EULA=TRUE
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && apk update 
COPY scripts /scripts
RUN chmod 777 /scripts/*.sh
RUN ["sh", "/scripts/build.sh"]
ENTRYPOINT [ "/scripts/entrypoint.sh" ]

