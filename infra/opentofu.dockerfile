FROM ghcr.io/opentofu/opentofu:1-minimal AS tofu

FROM ubuntu:24.04

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/tofu"]