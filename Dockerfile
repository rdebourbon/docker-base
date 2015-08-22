FROM ubuntu:15.04
MAINTAINER rdebourbon@xpandata.net

ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm"

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get install -qy locales && \
    echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup &&\
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
\
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -qy --force-yes \
        apt-transport-https \
        bzip2 \
        ca-certificates curl \
        dnsutils \
        fping \
        git \
        inetutils-ping \
        nano \
        openssl \
        openssh-server \
        procps psmisc python python-software-properties \
        rsync rsyslog \
        software-properties-common ssl-cert sudo supervisor \
        tar telnet tmux traceroute tree \
        wget whois \
        unrar unzip \
        vim \
        xz-utils \
        zsh && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*
