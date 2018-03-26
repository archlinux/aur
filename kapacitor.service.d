#[Service]
#ExecStart=
#ExecStart=/usr/bin/kapacitor -config /etc/kapacitor/kapacitor.conf $KAPACITOR_OPTS

[Service]
User=kapacitor
Group=kapacitor
LimitNOFILE=65536
EnvironmentFile=-/etc/default/kapacitor
ExecStart=/usr/bin/kapacitord -config /etc/kapacitor/kapacitor.conf $KAPACITOR_OPTS
KillMode=process
Restart=on-failure
