FROM ghcr.io/containerd/nerdctl:v2.2.0 AS git

# Set env var dedicated to build-time only (for availability during docker BUILD phase)
# - HTTP proxy settings
# - apt arguments (skip TLS validation with Zscaler)

ARG http_proxy
ARG https_proxy
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG APT_ARG_1
ARG APT_ARG_2

RUN apt-get ${APK_ARG_1} ${APT_ARG_2} update && apt-get install ${APK_ARG_1} ${APT_ARG_2} -y --no-install-recommends \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN echo '#!/bin/bash\nnerdctl "$@"' > /usr/bin/docker && \
    chmod +x /usr/bin/docker