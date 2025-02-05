FROM alpine:3.21

RUN apk add --no-cache \
    git \
    g++ \
    make \
    autoconf \
    automake \
    libtool \
    musl-dev \
    linux-headers

RUN git clone https://github.com/drk1wi/portspoof.git

WORKDIR /portspoof
RUN ./configure && \
    make && \
    make install && \
    mkdir -p /etc/portspoof && \
    cp tools/portspoof.conf /etc/portspoof/ && \
    cp tools/portspoof_signatures /etc/portspoof/


ENTRYPOINT ["portspoof"]
CMD ["-c", "/etc/portspoof/portspoof.conf", "-s", "/etc/portspoof/portspoof_signatures"]