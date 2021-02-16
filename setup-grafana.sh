#!/bin/bash

bash ./grafana/add-datasource.sh

sleep 2

bash ./grafana/add-dashboard.sh
