FROM ubuntu:latest

RUN apt-get update && apt-get -y install -qq curl inetutils-ping

# Copy files to the container
COPY pingmon.sh /opt/

# Give execution rights
RUN chmod 0744 /opt/pingmon.sh

# Run this command on container startup
CMD /bin/bash /opt/pingmon.sh
