#!/bin/bash
#Check well-known DNS latency every minute & send them to InfluxDB

sleep 1m

while true 
do
  echo "$(date)"

  # Cloudflare
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=$DNS_NAME_1 $(ping -c 1 $DNS_IP_1 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

  # Google
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=$DNS_NAME_2 $(ping -c 1 $DNS_IP_2 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

  # Chello-Warsaw
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=$DNS_NAME_3 $(ping -c 1 $DNS_IP_3 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"
  
  # Sleep til next full minute
  time_left=`expr 60 - $(date +%S)`
  sleep $time_left

done
