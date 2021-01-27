FROM ubuntu:latest

RUN apt-get update && apt-get -y install -qq cron curl inetutils-ping speedtest-cli

# Copy files to the container
COPY speedmon.sh pingmon.sh /opt/
COPY cronfile /etc/cron.d/cronfile

# Give execution rights
RUN chmod 0644 /etc/cron.d/cronfile
RUN chmod 0744 /opt/speedmon.sh /opt/pingmon.sh

# Apply cron job
RUN crontab /etc/cron.d/cronfile

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run this command on container startup to be able to load InfluxDB Token and tail cron logs
CMD printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export INFLUXDB" > /root/influx_token.sh && chmod 0744 /root/influx_token.sh && service cron start && tail -f /var/log/cron.log
