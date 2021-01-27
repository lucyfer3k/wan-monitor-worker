#!/bin/bash

#Cloudflare
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token $INFLUXDB_TOKEN" \
    --data-binary "ping,dest=cloudflare $(ping -c 1 1.1.1.1 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

#Google
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token $INFLUXDB_TOKEN" \
    --data-binary "ping,dest=google $(ping -c 1 8.8.4.4 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

#Chello-Warsaw
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token $INFLUXDB_TOKEN" \
    --data-binary "ping,dest=chello-warsaw $(ping -c 1 83.144.93.10 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

echo "$(date): pingmon was successful"
