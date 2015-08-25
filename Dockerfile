FROM alpine:3.2
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --update \
    bash \
    coreutils \
    curl \
    haproxy \
    iproute2 \
    ipsec-tools \
    iptables \
    jq \
    monit \
    nodejs \
    psmisc@testing \
    socat \
    tar \
    tcpdump \
    util-linux \
    && rm -rf /var/cache/apk/*
ADD startup.sh /etc/init.d/agent-instance-startup
CMD ["/etc/init.d/agent-instance-startup", "init"]
