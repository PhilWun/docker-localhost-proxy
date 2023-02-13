# Localhost proxy for docker containers

This can be added into `Dockerfile`s to install a proxy and configure it to redirect requests to host.docker.internal.
Only requests to the specified ports will be redirected.

## How to add it to a `Dockerfile`

Add the following to your `Dockerfile`:

```Dockerfile
# install proxy
ADD https://raw.githubusercontent.com/UST-QuAntiL/docker-localhost-proxy/v0.3/install_proxy.sh install_proxy.sh
RUN chmod +x install_proxy.sh && ./install_proxy.sh

# add localhost proxy files
ADD https://raw.githubusercontent.com/UST-QuAntiL/docker-localhost-proxy/v0.3/Caddyfile.template Caddyfile.template
ADD https://raw.githubusercontent.com/UST-QuAntiL/docker-localhost-proxy/v0.3/start_proxy.sh start_proxy.sh
RUN chmod +x start_proxy.sh
```

Then let the `start_proxy.sh` script run before starting your application e.g.:

```Dockerfile
CMD ./start_proxy.sh && ./start_app.sh
```