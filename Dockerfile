FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libisal-dev \
    libdeflate-dev \
    autoconf \
    automake \
    libtool \
    nasm \
    yasm \
    git \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /fastp

COPY . /fastp

RUN make -j$(nproc)

RUN cp fastp /usr/local/bin/

CMD ["./fastp"]
