FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
    jq \
    busybox \
    curl \
    dnsmasq \
    iptables \
    net-tools \
    logrotate \
    monit \
    socat \
    psmisc \
    tcpdump \
    uuid-runtime \
    vim-tiny \
    openssl \
    libssl-dev \
    software-properties-common \
    haproxy && \
    rm -rf /var/lib/apt/lists
ADD startup.sh /etc/init.d/agent-instance-startup
CMD ["/etc/init.d/agent-instance-startup", "init"]
# Work around overlay bug
RUN touch /etc/monit/conf.d/.hold
