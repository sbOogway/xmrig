FROM ubuntu:latest

# Install build dependencies and aarch64 cross-compiler
RUN apt-get update && apt-get install -y \
    git make cmake gcc g++ wget tar autoconf automake libtool \
    gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

# Copy source code
COPY . /xmrig

# Set working directory
WORKDIR /xmrig

# Build libuv, hwloc, and OpenSSL for ARM
RUN ./scripts/build.uv.sh
RUN ./scripts/build.hwloc.sh
RUN ./scripts/build.openssl.sh

# Build the application for aarch64
RUN cd build && \
    XMRIG_DEPS=/xmrig/deps cmake .. \
        -DCMAKE_C_COMPILER=aarch64-linux-gnu-gcc \
        -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ \
        -DCMAKE_SYSTEM_NAME=Linux \
        -DCMAKE_SYSTEM_PROCESSOR=aarch64 && \
    make