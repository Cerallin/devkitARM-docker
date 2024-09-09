# Forked from https://github.com/devkitPro/docker/blob/master/toolchain-base/Dockerfile
FROM devkitpro/devkitarm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y --no-install-recommends sudo ca-certificates curl wget bzip2 make gnupg && \
    apt-get install -y --no-install-recommends git git-restore-mtime && \
    apt-get install -y --no-install-recommends zip unzip && \
    apt-get install -y --no-install-recommends locales && \
    apt-get install -y --no-install-recommends patch && \
    apt-get install -y --no-install-recommends gcc g++ && \
    apt-get install -y --no-install-recommends imagemagick && \
    apt-get install -y --no-install-recommends ssh cppcheck && \
    apt-get install -y --no-install-recommends libfreeimage3 libfreeimage-dev && \
    apt-get install -y --no-install-recommends cmake vim && \
    apt-get install -y --no-install-recommends autoconf-archive autoconf-doc libtool && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get clean

ENV LANG en_US.UTF-8

# Setup env
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=${DEVKITPRO}/devkitARM
ENV PATH=${DEVKITPRO}/tools/bin:$PATH
