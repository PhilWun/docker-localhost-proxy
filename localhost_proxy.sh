#!/bin/bash

# check if environment variable was defined
if [[ -n "${LOCALHOST_PROXY_PORTS}" ]]; then
    # install caddy and other tools
    apt-get update
    apt-get install -y debian-keyring debian-archive-keyring apt-transport-https curl gettext
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
    apt-get update
    apt-get install -y caddy

    # configure Caddy
    envsubst < Caddyfile | tee Caddyfile # replace placeholders with the values of the respective environment variables

    caddy start
fi
