# syntax=docker/dockerfile:1

FROM ubuntu:latest

# Correct Timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Basic Tools
RUN apt update
#RUN DEBIAN_FRONTEND=noninteractive apt-get -o Acquire::http::proxy=http://localhost:3142

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    apache2-utils \
    aria2 \
    bash \
    bind9-dnsutils \
    bird \
    bridge-utils \
    build-essential \
    curl \
    dhcping \
    dnsutils \
    ethtool \
    file \
    fish \
    fping \
    gdu \
    git \
    gnupg \
    htop \
    httpie \
    iftop \
    iotop \
    iperf3 \
    iproute2 \
    ipset \
    iptables \
    iptraf-ng \
    iputils-ping \
    ipvsadm \
    jq \
    libffi-dev \
    libssl-dev \
    lsb-release \
    mc \
    mtr \
    mydumper \
    ncdu \
    pigz \
    neovim \
    net-tools \
    netcat-openbsd \
    netcat-traditional \
    nftables \
    ngrep \
    nmap \
    openssl \
    procps \
    pv \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    rsync \
    socat \
    sshfs \
    strace \
    swaks \
    tcpdump \
    tcptraceroute \
    termshark \
    tmux \
    traceroute \
    tree \
    tshark \
    util-linux \
    vim \
    wget \
    yq \
    zst \
    zstd

## MySQL Client
RUN DEBIAN_FRONTEND=noninteractive apt install -yq \
    mariadb-client

# mysqlsh
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.30-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive \
    dpkg -i mysql-apt-config_0.8.30-1_all.deb \
    && apt update \
    && apt install -yq mysql-shell

##RUN apt update
##RUN DEBIAN_FRONTEND=noninteractive apt install -yq \
##    mysql-shell

RUN chsh -s /usr/bin/fish

COPY whatismyip.sh /usr/local/bin/

# Clean up
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/apt/*
RUN rm -rf ./percona-release_latest.generic_all.deb
RUN rm -rf ./mysql-apt-config_0.8.30-1_all.deb

WORKDIR /root
