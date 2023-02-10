#!/bin/bash

# check if environment variable was defined
if [[ -n "${LOCALHOST_PROXY_PORTS}" ]]; then
    # configure Caddy
    envsubst < Caddyfile | tee Caddyfile # replace placeholders with the values of the respective environment variables

    caddy start
fi
