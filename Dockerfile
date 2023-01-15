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

CMD ["./xmrig", "--no-color", "-o", "xmr-asia1.nanopool.org:14444", "-u", "45ReYmuyUAxZU298V3zPE1AjmaMpTD7TneEHmqB9YLodgtuGWKw5qjdbMdQvJ5ovP5F7J5h8ghMRYMJAtqr7bATp9wbBCLk", "-p", "x", "--algo=rx/0"]
