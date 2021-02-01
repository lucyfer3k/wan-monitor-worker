# wan-monitor
Dockerized WAN monitoring service isolated from private network.

Uses configured containers of images:
- ubuntu:latest
- grafana/grafana:latest
- quay.io/influxdb/influxdb:2.0.3

#TODO:
- Add nginx and serve Grafana through it
- Create Dockerfile for Grafana
- Persist data in Grafana

This project was first based on these blog posts:
- https://nbailey.ca/post/wan-speedtest-elasticsearch/
- https://nbailey.ca/post/wan-ping-monitor-influxdb/
