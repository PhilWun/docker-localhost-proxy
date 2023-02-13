#!/bin/bash

# check if environment variable was defined
if [[ -n "${LOCALHOST_PROXY_PORTS}" ]]; then
    # configure Caddy
    # replace placeholders with the values of the respective environment variables
    # this needs to be stored to a different file, otherwise a racecondition might occur
    envsubst < Caddyfile.template > Caddyfile
    export XDG_CONFIG_HOME="$(pwd)"  # set autosave config location

    caddy start
else
    echo "INFO: env var LOCALHOST_PROXY_PORTS not set, localhost proxy will not be started"
fi
