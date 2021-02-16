# wan-monitor
Dockerized WAN monitoring service isolated from private network.

How to get started:
1. Configurate your environment within config.ini
2. Run setup-env.sh
3. docker-compose up
4. After Grafana is up and running: 
  a) Add datasource script ./grafana/add-datasource.sh
  b) Add dashboard script ./grafana/add-dashboard.sh
5. Go to http://localhost:8080 and login to Grafana using your username & password (default admin:password123)
6. Go to Dashboards -> Manage -> WAN Monitoring 


Based on images:
- ubuntu:latest
- grafana/grafana:latest
- quay.io/influxdb/influxdb:2.0.3
- nginx:lastest


This project was first based on these blog posts:
- https://nbailey.ca/post/wan-speedtest-elasticsearch/
- https://nbailey.ca/post/wan-ping-monitor-influxdb/
