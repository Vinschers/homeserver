#!/bin/sh


curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
ARCH=$(uname -m) && [ "${ARCH}" = "armv7l" ] && ARCH="armv7"
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-${ARCH}" -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

sudo mkdir -p /opt/appdata

sudo cp -r "$THIS_DIRECTORY/docker/*" /opt/appdata/

{ echo "\$PUID=$(id | sed 's/^uid=//;s/(.*$//')"; echo "\$PGID=$(id | sed 's/^.*=//;s/(.*$//')"; echo "\$TIMEZONE="; } >> "$HOME/.env"
