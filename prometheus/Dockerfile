FROM arm32v7/ubuntu
MAINTAINER "Slavisa Lukic" <slavisa.lukic@gmail.com>

RUN apt-get update && apt-get install -qy curl ca-certificates
WORKDIR /root/
RUN mkdir /root/prometheus

RUN curl -sSLO https://github.com/prometheus/prometheus/releases/download/v2.6.0/prometheus-2.6.0.linux-armv7.tar.gz && \
   tar -xvf prometheus-2.6.0.linux-armv7.tar.gz -C /root/prometheus/ --strip-components=1 && \
   rm prometheus-2.6.0.linux-armv7.tar.gz

workdir /root/prometheus

RUN mkdir -p /usr/share/prometheus
RUN mkdir -p /etc/prometheus
RUN mv ./prometheus /usr/bin/
RUN mv ./promtool /usr/bin/
RUN mv ./console_libraries /usr/share/prometheus/
RUN mv ./consoles /usr/share/prometheus/

COPY prometheus.yml /etc/prometheus

RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/ && \
    mkdir -p /prometheus && \
    chown -R nobody:nogroup /etc/prometheus /prometheus && \
    ln -s /prometheus /etc/prometheus/data
USER       nobody
EXPOSE 9090
VOLUME     [ "/prometheus" ]
WORKDIR /etc/prometheus
ENTRYPOINT [ "/usr/bin/prometheus" ]
CMD ["--config.file=/etc/prometheus/prometheus.yml", \
     "--web.console.libraries=/usr/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/share/prometheus/consoles" ]

