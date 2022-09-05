FROM mowijo/cpp-development:v1

RUN ( \
    cd /tmp && \
    wget http://dist.libuv.org/dist/v1.14.0/libuv-v1.14.0.tar.gz && \
    tar xzf libuv-v1.14.0.tar.gz && \
    cd libuv-v1.14.0 && \
    sh autogen.sh && \
    ./configure && \
    make install && \
    cd && \
    rm -rf /tmp/libuv-v1.14.0 \
   )

RUN ( \
    cd /tmp && \
    git clone --depth 1 --branch 2.16.2 https://github.com/datastax/cpp-driver.git && \
    cd cpp-driver && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd && \
    rm -rf /tmp/cpp-driver \
)

RUN ldconfig
