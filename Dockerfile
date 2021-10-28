FROM ubuntu:focal

RUN apt update \
    && apt install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

RUN curl -sL https://github.com/pgaskin/easy-novnc/releases/download/v1.1.0/easy-novnc_linux-64bit -o /bin/easy-novnc \
    && chmod 775 /bin/easy-novnc

WORKDIR /

USER nobody
ENTRYPOINT ["/bin/easy-novnc"]