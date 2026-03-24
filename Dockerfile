FROM mariadb:11@sha256:31c1aa20ba2d78c4cbc45b2675e40ffd6a3cd59897a9767ce88fc284309f55ab

# Install dependencies + pipx
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        pipx \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install awscli via pipx (isolated environment)
RUN pipx install awscli

# Make pipx binaries available globally
ENV PATH="/root/.local/bin:$PATH"

RUN addgroup --gid 1000 appgroup \
 && adduser --gid 1000 --uid 1000 --disabled-password --gecos appuser appuser

USER 1000