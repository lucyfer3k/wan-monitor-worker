# wan-monitor
Dockerized WAN monitoring service isolated from private network (except Grafana).

![](https://i.imgur.com/zJNA6Xm.png)

### How to get started:
1. Configurate your environment within `config.ini`
2. Setup environmental variables `./setup-env.sh`
3. Start your containers `docker-compose up`
4. After Grafana is up and running add datasource through `./grafana/add-datasource.sh`
5. Add dashboard script `./grafana/add-dashboard.sh`
6. Go to http://localhost:8080 and login to Grafana using your username & password (default admin:password123)
7. Go to Dashboards -> Manage<br/>
![](https://i.imgur.com/uRt18fP.png)
8. Choose WAN Monitoring

#### Example of gathered data:

![](https://i.imgur.com/fUrOOhe.png)

#### Tested on:
- Docker version 20.10.3
- docker-compose version 1.28.2
- Manjaro Nibia 20.2.1

#### Based on images:
- ubuntu:latest
- grafana/grafana:latest
- quay.io/influxdb/influxdb:2.0.3
- nginx:lastest


#### This project was first based on these blog posts:
- https://nbailey.ca/post/wan-speedtest-elasticsearch/
- https://nbailey.ca/post/wan-ping-monitor-influxdb/
