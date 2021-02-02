FROM quay.io/influxdb/influxdb:v2.0.3

COPY ./setup-influxdb.sh /root/
RUN chmod 0744 /root/setup-influxdb.sh
CMD /root/setup-influxdb.sh

