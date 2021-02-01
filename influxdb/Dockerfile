FROM quay.io/influxdb/influxdb:v2.0.3

# Copy setup process and make it executable

COPY ./first-run.sh /root/
RUN chmod 0744 /root/first-run.sh

# First start should setup influxdb with .env values

CMD /bin/bash /root/first-run.sh

