FROM python:alpine

LABEL org.opencontainers.image.authors="Hugo Haas"
LABEL org.opencontainers.image.source="https://github.com/hugoh/docker-tmo-monitor"

RUN apk add iputils git

RUN adduser -D -h /monitor monitor

COPY entrypoint.sh /

RUN git clone --depth=1 https://github.com/highvolt-dev/tmo-monitor.git && \
    cd tmo-monitor && \
    pip3 install .

ENTRYPOINT [ "/entrypoint.sh" ]
