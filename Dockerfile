FROM mariadb:11@sha256:31c1aa20ba2d78c4cbc45b2675e40ffd6a3cd59897a9767ce88fc284309f55ab

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install awscli && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1000 appgroup \
 && adduser --gid 1000 --uid 1000 --disabled-password --gecos appuser appuser

USER 1000