#!/bin/sh

export THIS_DIRECTORY="$(dirname "$0")"
export DEBIAN_FRONTEND=noninteractive

printf "SSH port: "
read -r ssh_port
printf "SSH public key: "
read -r ssh_key

. "$THIS_DIRECTORY/docker.sh"

. "$THIS_DIRECTORY/security.sh"
. "$THIS_DIRECTORY/swag.sh"
. "$THIS_DIRECTORY/nextcloud.sh"

. "$THIS_DIRECTORY/end.sh"

printf "\n\n\nPlease, edit the .env file to fill up all the necessary environment variables.\n"
printf "After that, run docker-compose up -d --env-file .env\n"
