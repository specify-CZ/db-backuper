FROM mariadb:11@sha256:f16d7a344413e519dff518f27bdb221388f84b0d274c97c4fb5f2cb0dc1b34fa

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

RUN addgroup --gid 1000 appgroup \
 && adduser --gid 1000 --uid 1000 --disabled-password --gecos appuser appuser

USER 1000