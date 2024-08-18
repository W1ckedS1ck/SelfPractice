#!/bin/bash
#--------------------------------------------------------------------
# Latest version could be found https://prometheus.io/download/     #
#--------------------------------------------------------------------
PROMETHEUS_VERSION="2.54.0"
PROMETHEUS_FOLDER_CONFIG="/etc/prometheus"
PROMETHEUS_FOLDER_TSDATA="/etc/prometheus/data"

cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
tar xvfz prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
cd prometheus-$PROMETHEUS_VERSION.linux-amd64

mkdir -p $PROMETHEUS_FOLDER_CONFIG
mkdir -p $PROMETHEUS_FOLDER_TSDATA

mv prometheus /usr/bin/
mv prometheus.yml $PROMETHEUS_FOLDER_CONFIG
rm -rf /tmp/prometheus*

#--------------------------------------------------------------------
# Configutation of prometheus.yml (adding targets and so on)        #
#--------------------------------------------------------------------
# mv $PROMETHEUS_FOLDER_CONFIG/prometheus.yml prometheus.yml_bak
#
#cat <<EOF> $PROMETHEUS_FOLDER_CONFIG/prometheus.yml
#global:
#  scrape_interval: 15s
#
#scrape_configs:
#  - job_name      : "prometheus"
#    static_configs:
#      - targets: ["localhost:9090"]
#EOF


useradd -rs /bin/false prometheus
chown prometheus:prometheus /usr/bin/prometheus
chown prometheus:prometheus $PROMETHEUS_FOLDER_CONFIG
chown prometheus:prometheus $PROMETHEUS_FOLDER_CONFIG/prometheus.yml
chown prometheus:prometheus $PROMETHEUS_FOLDER_TSDATA

#--------------------------------------------------------------------
# Create Prom service                                               #
#--------------------------------------------------------------------
cat <<EOF> /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Server
After=network.target

[Service]
User=prometheus
Group=prometheus
Type=simple
Restart=on-failure
ExecStart=/usr/bin/prometheus \
  --config.file       ${PROMETHEUS_FOLDER_CONFIG}/prometheus.yml \
  --storage.tsdb.path ${PROMETHEUS_FOLDER_TSDATA}

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start prometheus
systemctl enable prometheus
systemctl status prometheus --no-pager
prometheus --version
