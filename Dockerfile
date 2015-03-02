FROM debian:jessie
MAINTAINER Jonathan Creekmore <jonathan@thecreekmores.org>

# Building a container we won't have an interactive prompt
ENV DEBIAN_FRONTEND noninteractive


# Install essential build tools
# Done as one big command to keep the image leaner
RUN apt-get --quiet --yes update && \
    apt-get --quiet --yes install \
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
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

WORKDIR /tmp
