# LiteLoaderBDS Server on Docker

Docker image that provides a LiteLoaderBDS server that will automatically download selected version at startup 

## Install

The following starts a LiteLoaderBDS server running a default version and exposing the default UDP port:

```sh
docker run -d -it -e EULA=TRUE -p 19132:19132/udp -v mc-server-data:/data ghcr.io/liteldev/liteloaderbds-server
```

If you plan to use the server in production, it is recommended to use Docker Compose to manage the container. You can use the following `docker-compose.yml` file as a template:

```yml
services:
  mc-server:
    image: ghcr.io/liteldev/liteloaderbds-server
    environment:
      EULA: "TRUE"
    ports:
      - 19132:19132/udp
    volumes:
      - mc-server-data:/data
    stdin_open: true
    tty: true

volumes:
  mc-server-data:
```

## Usage

### Environment variables

- `EULA`(`FALSE`): must be set to `TRUE` to accept the [Minecraft End User License Agreement](https://minecraft.net/terms).
- `COREPACK_VERSION`(`LATEST`): can be set to a specific [corepack](https://github.com/tooth-hub/corepack/tags) version or `LATEST` to automatically download the latest version.
