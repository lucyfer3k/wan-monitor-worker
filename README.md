# wan-monitor
Dockerized WAN monitoring service isolated from private network.

Uses configured containers of images:
- ubuntu:latest
- grafana/grafana:latest
- docker.elastic.co/elasticsearch/elasticsearch:7.10.2
- quay.io/influxdb/influxdb:2.0.3

#TODO:
- Add nginx and serve grafana through it
- Create Dockerfile for grafana and InfluxDB so it can be used without first setup directly on it
- Eliminate elasticsearch from the process and use only InfluxDB
- Persist InfluxDB data

This project was first based on these blog posts:
- https://nbailey.ca/post/wan-speedtest-elasticsearch/
- https://nbailey.ca/post/wan-ping-monitor-influxdb/
