#!/bin/bash
#Perform speedtest to nearest server every hour & send them to InfluxDB

sleep 2m

while true
do
  echo "$(date)"
  set -eo pipefail

  echo $(speedtest-cli --csv) > ./speedtest_last_result.csv

  Download=$(cat ./speedtest_last_result.csv | cut -d ',' -f7)
  Upload=$(cat ./speedtest_last_result.csv | cut -d ',' -f8)


  curl --request POST "http://influxdb:8086/api/v2/write?org=$INFLUXDB_ORG&bucket=$INFLUXDB_BUCKET" \
      --header "Content-Type: application/json" \
      --header "Authorization: Token $INFLUXDB_TOKEN" \
      --data-binary "speedtest,host=worker download=$Download,upload=$Upload $(date +%s%N)" >> /dev/null

  # Sleep til next full hour
  time_left_m=`expr 60 - $(date +%M)`
  time_left_s=`expr 60 - $(date +%S)`
  sleep $time_left_m\m $time_left_s

done
