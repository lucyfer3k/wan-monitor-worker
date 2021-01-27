#!/bin/bash
set -eo pipefail

SPEEDTEST_JSON=$(speedtest-cli --json)
DATEFMT=$(date +%Y.%V)

curl -H "Content-Type: application/json" \
    -XPOST "http://elasticsearch:9200/speedtest-$DATEFMT/doc" \
    -d "$SPEEDTEST_JSON" >> /dev/null

echo "$(date): speedtest was successful"
