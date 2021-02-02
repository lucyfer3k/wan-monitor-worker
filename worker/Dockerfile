FROM ubuntu:latest
RUN apt-get update && apt-get -y install -qq curl speedtest-cli inetutils-ping
COPY pingmon.sh speedmon.sh /opt/
RUN chmod 0744 /opt/speedmon.sh /opt/pingmon.sh
