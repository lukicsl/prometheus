FROM arm32v7/ubuntu
MAINTAINER "Slavisa Lukic" <slavisa.lukic@gmail.com>

RUN apt-get update && apt-get install -qy curl ca-certificates
WORKDIR /root/
RUN mkdir /root/haproxy-exporter

RUN curl -sSLO https://github.com/prometheus/haproxy_exporter/releases/download/v0.9.0/haproxy_exporter-0.9.0.freebsd-armv7.tar.gz && \
   tar -xvf haproxy_exporter-0.9.0.freebsd-armv7.tar.gz -C /root/haproxy-exporter/ --strip-components=1 && \
   rm haproxy_exporter-0.9.0.freebsd-armv7.tar.gz

FROM        quay.io/prometheus/busybox:glibc
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

COPY --from=0 /root/haproxy-exporter/haproxy_exporter /bin/haproxy_exporter

EXPOSE      9101
USER        nobody
ENTRYPOINT  [ "/bin/haproxy_exporter" ]

