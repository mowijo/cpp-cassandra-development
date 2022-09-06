FROM mowijo/cpp-development:v2

RUN apk update
RUN apk --no-cache add libuv-dev openssl-dev

RUN ( \
    cd /tmp && \
    git clone --depth 1 --branch 2.16.2 https://github.com/datastax/cpp-driver.git && \
    cd cpp-driver && \
    mkdir build && \
    cd build && \
    cmake -GNinja .. && \
    ninja && \
    ninja install && \
    cd && \
    rm -rf /tmp/cpp-driver \
)

RUN ldconfig /etc/ld.so.conf.d
