# Forked from https://github.com/devkitPro/docker/blob/master/toolchain-base/Dockerfile
FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y --no-install-recommends sudo ca-certificates pkg-config curl wget bzip2 make gnupg && \
    apt-get install -y --no-install-recommends git git-restore-mtime && \
    apt-get install -y --no-install-recommends zip unzip && \
    apt-get install -y --no-install-recommends locales && \
    apt-get install -y --no-install-recommends patch && \
    apt-get install -y --no-install-recommends gcc g++ && \
    apt-get install -y --no-install-recommends imagemagick && \
    apt-get install -y --no-install-recommends autoconf automake autoconf-archive autoconf-doc libtool && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean

RUN wget https://apt.devkitpro.org/install-devkitpro-pacman && \
    chmod +x ./install-devkitpro-pacman && \
    ./install-devkitpro-pacman && \
    rm ./install-devkitpro-pacman && \
    yes | dkp-pacman -Scc

RUN dkp-pacman -Syyu --noconfirm 3ds-dev nds-dev gp32-dev gba-dev gp2x-dev && \
    dkp-pacman -S --needed --noconfirm 3ds-portlibs nds-portlibs armv4t-portlibs && \
    yes | dkp-pacman -Scc

ENV LANG en_US.UTF-8

ENV DEVKITPRO=/opt/devkitpro

ENV DEVKITARM=${DEVKITPRO}/devkitARM

ENV PATH=${DEVKITPRO}/tools/bin:$PATH
