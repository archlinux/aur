# https://raw.githubusercontent.com/influxdata/influxdb/279bf1bf13bb391ac5635bbcccfe8d7524dadb92/scripts/influxdb.service
[Unit]
Description=InfluxDB 2.x is an open-source, distributed, time series database
Documentation=https://v2.docs.influxdata.com/v2.0/get-started/
After=network-online.target

[Service]
User=influxdb
Group=influxdb
LimitNOFILE=65536
#ExecStart=
ExecStart=/usr/bin/influxd --reporting-disabled
KillMode=control-group
Restart=on-failure
#TimeoutStopSec=infinity
#TimeoutStartSec=infinity

[Install]
WantedBy=multi-user.target
Alias=influxd.service