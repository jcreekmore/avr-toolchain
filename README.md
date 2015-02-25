# AVR toolchain in a Docker

AVR toolchain in a Docker container to have a build toolchain.

## Current version

- based on debian:jessie with build-essential
- gcc-avr: 4.8.1+Atmel3.4.4-2
- avr-libc: 1.8.0+Atmel3.4.4-1
- binutils-avr: 2.24+Atmel3.4.4-1
- also includes avrdude, gdb-avr, etc.

## Quick Start

```bash
docker run -v ${pwd}:/tmp jcreekmore/avr-toolchain COMMAND
```
