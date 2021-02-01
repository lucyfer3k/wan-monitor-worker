FROM ubuntu:latest

RUN apt-get update && apt-get -y install -qq curl speedtest-cli

# Copy files to the container
COPY speedmon.sh /opt/

# Give execution rights
RUN chmod 0744 /opt/speedmon.sh

# Run this command on container startup
CMD /bin/bash /opt/speedmon.sh
