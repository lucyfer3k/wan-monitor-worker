#!/bin/bash

# enable job control
set -m

# Start influxdb first setup and wait for it to go up
if [ ! -f /root/.influxdbv2/config ]; then
  echo "Running influxdb first setup"
  
  influxd  &
  sleep 10

  # Run influxdb first setup
  influx setup \
        --org $INFLUXDB_ORG \
        --bucket $INFLUXDB_BUCKET \
        --username $INFLUXDB_USERNAME \
        --password $INFLUXDB_PASSWORD \
        --token $INFLUXDB_TOKEN \
        --force

  # Wait for setup to end and return influxd to foreground

  sleep 5
  fg

else
  influxd run
fi
