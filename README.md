# wan-monitor
Dockerized WAN monitoring service isolated from private network.

How to get started:
1. Configurate your environment within config.ini
2. Run setup-env.sh
3. docker-compose up
4. After Grafana is up and running run ./grafana/add-datasource.sh script
5. Go to http://localhost:3000 and login to Grafana using your username & password (default admin:password123)
6. Add dashboard basing on flux queries from grafana.d of this project


Based on images:
- ubuntu:latest
- grafana/grafana:latest
- quay.io/influxdb/influxdb:2.0.3

#TODO:
- Add nginx and serve Grafana through it
- Set dashboard and datasource automatically in Grafana

This project was first based on these blog posts:
- https://nbailey.ca/post/wan-speedtest-elasticsearch/
- https://nbailey.ca/post/wan-ping-monitor-influxdb/
