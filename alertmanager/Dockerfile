FROM arm32v7/ubuntu
MAINTAINER "Slavisa Lukic" <slavisa.lukic@gmail.com>

RUN apt-get update && apt-get install -qy curl ca-certificates
WORKDIR /root/
RUN mkdir /root/alertmanager

RUN curl -sSLO https://github.com/prometheus/alertmanager/releases/download/v0.16.0-alpha.0/alertmanager-0.16.0-alpha.0.linux-armv7.tar.gz && \
   tar -xvf alertmanager-0.16.0-alpha.0.linux-armv7.tar.gz -C /root/alertmanager/ --strip-components=1 && \
   rm alertmanager-0.16.0-alpha.0.linux-armv7.tar.gz

workdir /root/alertmanager

RUN mkdir -p /etc/alertmanager
RUN mv ./alertmanager /usr/bin/
RUN mv ./amtool /usr/bin/
RUN mv ./alertmanager.yml /etc/alertmanager

EXPOSE 9093
VOLUME [ "/alertmanager" ]
WORKDIR /alertmanager
ENTRYPOINT [ "/usr/bin/alertmanager" ]
CMD        [ "--config.file=/etc/alertmanager/alertmanager.yml", \
             "--storage.path=/alertmanager" ]
