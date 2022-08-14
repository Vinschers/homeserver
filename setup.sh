#!/bin/sh

export THIS_DIRECTORY="$(dirname "$0")"
export DEBIAN_FRONTEND=noninteractive

echo -n "SSH port: "
read ssh_port
echo -n "SSH public key: "
read ssh_key
echo -n "Time zone: "
read timezone
echo -n "DNS: "
read dns
echo -n "Cloudflare email: "
read cloudflare_email
echo -n "Cloudflare API key: "
read cloudflare_api

. "$THIS_DIRECTORY/security.sh"

. "$THIS_DIRECTORY/docker-setup.sh"

. "$THIS_DIRECTORY/end.sh"
