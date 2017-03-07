FROM ubuntu:16.04

MAINTAINER Jared Ballou <github@jballou.com>

ENV DEBIAN_FRONTEND noninteractive

# Run a quick apt-get update/upgrade
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

# Install dependencies, mainly for SteamCMD
RUN apt-get install --no-install-recommends -y \
    ca-certificates \
    software-properties-common \
    python-software-properties \
    lib32gcc1 \
    xvfb \
    curl \
    wget \
    telnet \
    expect


# Download and extract SteamCMD
RUN mkdir -p /opt/steamcmd

RUN cd /opt/steamcmd && curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

VOLUME ["/opt/steamcmd"]
WORKDIR /opt/steamcmd

# This container will be executable
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["./steamcmd.sh"]
