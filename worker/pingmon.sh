#!/bin/bash
#Check well-known DNS latency every minute & send them to InfluxDB

sleep 1m

while true 
do
  echo "$(date)"

  # Cloudflare
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=cloudflare $(ping -c 1 1.1.1.1 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

  # Google
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=google $(ping -c 1 8.8.4.4 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

  # Chello-Warsaw
  curl -s --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "ping,dest=chello-warsaw $(ping -c 1 83.144.93.10 | \
      awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"
  
  # Sleep til next full minute
  time_left=`expr 60 - $(date +%S)`
  sleep $time_left

done
