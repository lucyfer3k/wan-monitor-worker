FROM ubuntu:latest

RUN apt-get update && apt-get -y install -qq cron curl inetutils-ping speedtest-cli

# Copy files to the container
COPY speedmon.sh pingmon.sh /opt/
COPY wanmon-cron /etc/cron.d/wanmon-cron

# Give execution rights
RUN chmod 0644 /etc/cron.d/wanmon-cron
RUN chmod 0744 /opt/speedmon.sh /opt/pingmon.sh

# Apply cron job
RUN crontab /etc/cron.d/wanmon-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
