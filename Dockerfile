FROM fedora:21
MAINTAINER Jonathan Creekmore <jonathan@thecreekmores.org>

# Install essential build tools
# Done as one big command to keep the image leaner
RUN yum -y install make && \
    yum clean all


# Install AVR development packages
# Done as one big command to keep the image leaner
RUN yum -y install avr-gcc avr-binutils avr-libc avr-gdb avrdude && \
    yum clean all

WORKDIR /tmp
