FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    git \
    cmake \
    libuv1-dev \
    libmicrohttpd-dev \
    libhwloc-dev

WORKDIR /app

RUN git clone https://github.com/xmrig/xmrig.git

WORKDIR /app/xmrig

RUN cmake .
RUN make

ENV URL=pool.supportxmr.com:3333
ENV USERNAME=YOUR_WALLET_ADDRESS
ENV THREADS=4

CMD ["./xmrig", "--no-color", "-o", "$URL", "-u", "$USERNAME", "-p", "x", "-t", "$THREADS"]
