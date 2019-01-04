FROM arm32v7/ubuntu
MAINTAINER "Slavisa Lukic" <slavisa.lukic@gmail.com>

RUN apt-get update && apt-get install -qy curl ca-certificates
WORKDIR /root/
RUN mkdir /root/node-exporter

RUN curl -sSLO https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-armv7.tar.gz && \
   tar -xvf node_exporter-0.17.0.linux-armv7.tar.gz -C /root/node-exporter/ --strip-components=1 && \
   rm node_exporter-0.17.0.linux-armv7.tar.gz

FROM        arm32v6/alpine:latest
LABEL "Slavisa Lukic" <slavisa.lukic@gmail.com>

COPY --from=0 /root/node-exporter/node_exporter /bin/node_exporter

EXPOSE      9100
USER        nobody
ENTRYPOINT  [ "/bin/node_exporter" ]
