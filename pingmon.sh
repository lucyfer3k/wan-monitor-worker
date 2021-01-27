#!/bin/bash
DATEPRT=$(date)

#Cloudflare
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token zRKFVzjb-xeUrC4-81L1CQvVQ_OqPcXP4c4cmKqjVKtGXFOz0ka22aVP_-ZN2mkuhG4lURrKneLI5KcNjjgIBw==" \
    --data-binary "ping,dest=cloudflare $(ping -c 1 1.1.1.1 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

#Google
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token zRKFVzjb-xeUrC4-81L1CQvVQ_OqPcXP4c4cmKqjVKtGXFOz0ka22aVP_-ZN2mkuhG4lURrKneLI5KcNjjgIBw==" \
    --data-binary "ping,dest=google $(ping -c 1 8.8.4.4 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

#Chello-Warsaw
curl --request POST "http://influxdb:8086/api/v2/write?org=MW&bucket=netstats" \
    --header "Authorization: Token zRKFVzjb-xeUrC4-81L1CQvVQ_OqPcXP4c4cmKqjVKtGXFOz0ka22aVP_-ZN2mkuhG4lURrKneLI5KcNjjgIBw==" \
    --data-binary "ping,dest=chello-warsaw $(ping -c 1 83.144.93.10 | \
    awk '/time=/{print $7}' | sed -e 's/time/rtt/g') $(date +%s%N)"

echo "$DATEPRT: pingmon is a success"
