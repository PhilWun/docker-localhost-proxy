#!/bin/bash

echo "pwd: $(pwd)"

if [[ -e "Caddyfile"]]; then
    echo "content of Caddyfile: $(cat Caddyfile)"
else
    echo "Caddyfile does not exists."
fi

# check if environment variable was defined
if [[ -n "${LOCALHOST_PROXY_PORTS}" ]]; then
    echo "env var LOCALHOST_PROXY_PORTS is set to ${LOCALHOST_PROXY_PORTS}"

    # configure Caddy
    envsubst < Caddyfile | tee Caddyfile # replace placeholders with the values of the respective environment variables

    echo "content of Caddyfile: $(cat Caddyfile)"

    caddy start
else
    echo "env var LOCALHOST_PROXY_PORTS is not set"
