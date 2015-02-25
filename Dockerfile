FROM debian:jessie
MAINTAINER Jonathan Creekmore <jonathan@thecreekmores.org>

# Building a container we won't have an interactive prompt
ENV DEBIAN_FRONTEND noninteractive


# Install essential build tools
# Done as one big command to keep the image leaner
RUN apt-get --quiet --yes update && \
    apt-get --quiet --yes install build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Install AVR development packages
# Done as one big command to keep the image leaner
RUN apt-get --quiet --yes update && \
    apt-get --quiet --yes install gcc-avr avra binutils-avr avr-libc && \
    apt-get --quiet --yes install avrprog avrp avrdude gdb-avr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

WORKDIR /tmp
