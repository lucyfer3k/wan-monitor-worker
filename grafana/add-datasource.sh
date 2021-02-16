#!/bin/bash

. ./.env

generate_post_data()
{
  cat <<EOF
{
  "name":"InfluxDB",
  "type":"influxdb",
  "access":"proxy",
  "url":"http://influxdb:8086",
  "basicAuth":true,
  "isDefault":true,
  "secureJsonData": {
    "token":"$INFLUXDB_TOKEN"
  },
  "jsonData": {
      "defaultBucket":"$INFLUXDB_BUCKET",
      "httpMode":"POST",
      "organization":"$INFLUXDB_ORG",
      "timeInterval":"30s",
      "version":"Flux"
    }
}
EOF
}


curl --request POST "http://$GF_SECURITY_ADMIN_USER:$GF_SECURITY_ADMIN_PASSWORD@localhost:8080/api/datasources" \
 --header "Accept: application/json" \
 --header "Content-Type: application/json" \
 --data "$(generate_post_data)"
