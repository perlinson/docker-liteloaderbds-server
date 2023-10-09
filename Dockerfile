FROM alpine:edge
RUN apk add --no-cache wine libc6-compat wget
ARG lip_version=0.14.2
WORKDIR /server_prebuilt
RUN wget https://github.com/LipPkg/Lip/releases/download/v${lip_version}/lip-linux-amd64.tar.gz && \
mkdir lip && \
tar -xvf lip-linux-amd64.tar.gz -C lip && \
chmod +x lip/lip && \
mkdir bedrock_server && \
cd bedrock_server && \
../lip/lip install liteloaderbds && \
WINEDEBUG=-all wine64 PeEditor.exe && \
rm ../lip-linux-amd64.tar.gz && \
rm ~/.wine -r
COPY entrypoint.sh /
WORKDIR /server
ENV WINEDEBUG=-all
ENTRYPOINT ["sh", "/entrypoint.sh"]
