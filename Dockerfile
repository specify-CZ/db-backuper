FROM mariadb:11@sha256:31c1aa20ba2d78c4cbc45b2675e40ffd6a3cd59897a9767ce88fc284309f55ab

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*


RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

RUN addgroup --gid 1000 appgroup \
 && adduser --gid 1000 --uid 1000 --disabled-password --gecos appuser appuser

USER 1000