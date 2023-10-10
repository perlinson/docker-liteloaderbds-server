#! /usr/bin/env sh

# Set default values for environment variables
COREPACK_VERSION="${COREPACK_VERSION:-LATEST}"
EULA="${EULA:-FALSE}"

# Enforce EULA
if [ $(echo "$EULA" | tr '[:lower:]' '[:upper:]') != "TRUE" ]; then
    echo "You must accept the Minecraft EULA to run the server."
    echo "Set the environment variable EULA to true to accept it."
    exit 1
fi

# Install dependencies if needed
if [ -z "$(ls -A)" ]; then
    # If COREPACK_VERSION is set to a specific version, add a "@" prefix
    # to the suffix. If it is set to "LATEST", leave it empty.
    COREPACK_VERSION_SUFFIX=""
    if [ "$COREPACK_VERSION" != "LATEST" ]; then
        COREPACK_VERSION_SUFFIX="@$COREPACK_VERSION"
    fi

    lip install -y github.com/tooth-hub/corepack$COREPACK_VERSION_SUFFIX

    wine64 PeEditor.exe
fi

wine64 bedrock_server_mod.exe
