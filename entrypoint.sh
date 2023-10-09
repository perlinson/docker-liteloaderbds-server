#!/bin/bash
if [ -d "/server_prebuilt" ]; then
    mv /server_prebuilt/* /server/
    rm -r /server_prebuilt
fi
cd /server/bedrock_server
wine64 bedrock_server_mod.exe
