FROM debian:jessie
MAINTAINER Jonathan Creekmore <jonathan@thecreekmores.org>

# Set APT_GET_UPDATE to make consistent images
ENV APT_GET_UPDATE 2015-12-30

# Install essential build tools.
# Done as one big command to keep the image leaner.
# Building a container, we won't have an interactive prompt
# during image build (DEBIAN_FRONTEND=noninteractive).

RUN DEBIAN_FRONTEND=noninteractive apt-get --quiet --yes update \
    && DEBIAN_FRONTEND=noninteractive apt-get --quiet --yes install \
        avr-libc \
        avra \
        avrdude \
        avrp \
        avrprog \
        build-essential \
        binutils-avr \
        python \
        gcc-avr \
        gdb-avr \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /tmp