#!/bin/bash
#------------------------------------------------------------------------------------------------
# Latest version could be found https://github.com/VictoriaMetrics/VictoriaMetrics/releases     #                            
#------------------------------------------------------------------------------------------------
VM_VERSION="1.102.1"
#VM_FOLDER_CONFIG="/etc/"
VM_FOLDER_TSDATA="/etc/VictoriaMetrics/"
#IP=$(hostname -I | awk '{print $2}') 
#IP=$(curl 2ip.ru)

cd /tmp
wget https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v$VM_VERSION/victoria-metrics-linux-amd64-v$VM_VERSION.tar.gz
tar xvfz victoria-metrics-linux-amd64-v$VM_VERSION.tar.gz
mv victoria-metrics-prod /usr/bin/
chmod +x /usr/bin/victoria*
rm -rf /tmp/victoria-metrics*

useradd -rs /bin/false VictoriaMetrics
chown VictoriaMetrics:VictoriaMetrics /usr/bin/victoria-metrics-prod

#--------------------------------------------------------------------
# Create VictoriaMetrics service                                    #
#--------------------------------------------------------------------
echo "
[Unit]
Description=Description=victoriametrics service
After=network.target

[Service]
User=victoriametrics
Group=victoriametrics
Type=simple
Restart=on-failure
ExecStart=/usr/bin/victoria-metrics-prod \
#       -storageDataPath=$VM_FOLDER_TSDATA \
#       -httpListenAddr=0.0.0.0:8428 \
#       -retentionPeriod=1
#1 Month

[Install]
WantedBy=multi-user.target
" >/etc/systemd/system/victoriametrics.service

systemctl daemon-reload
systemctl restart victoriametrics
systemctl enable victoriametrics
systemctl status victoriametrics --no-pager
victoria-metrics-prod  --version
