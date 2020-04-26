# Cài TIG

https://devconnected.com/how-to-setup-telegraf-influxdb-and-grafana-on-linux/#I_Installing_InfluxDB

## Cài influxDB

```
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -

source /etc/lsb-release

echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

apt-get update

apt-get install -y influxdb


systemctl start influxdb.service

systemctl status influxdb.service

systemctl enable influxdb.service
```

### Cài InfluxDB 2.0

https://v2.docs.influxdata.com/v2.0/get-started/

Copy được link:

https://dl.influxdata.com/influxdb/releases/influxdb_2.0.0-beta.9_linux_amd64.tar.gz

    wget https://dl.influxdata.com/influxdb/releases/influxdb_2.0.0-beta.9_linux_amd64.tar.gz

    tar xvzf influxdb_2.0.0-beta.9_linux_amd64.tar.gz

    cp influxdb_2.0.0-beta.9_linux_amd64/{influx,influxd} /usr/local/bin/

    useradd -rs /bin/false influxdb

    cd /lib/systemd/system

    nano influxdb2.service

Dán vào file `influxdb2.service` các dòng

```
[Unit]
Description=InfluxDB 2.0 service file.
Documentation=https://v2.docs.influxdata.com/v2.0/get-started/
After=network-online.target

[Service]
User=influxdb
Group=influxdb
ExecStart=/usr/local/bin/influxd 
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

    systemctl start influxdb2

    systemctl status influxdb2

    systemctl enable influxdb2

    ufw allow 9999/tcp

Truy cập vào:

http://localhost:9999.