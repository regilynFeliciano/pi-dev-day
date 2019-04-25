#!/bin/bash
# Fixes some post install stuff.

wget https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/startPiNaut.sh -P /opt/pi-naut/
wget https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/stopPiNaut.sh -P /opt/pi-naut/

sudo cat > /etc/systemd/system/pi-naut.service << EOL
[Unit]
Description=Java Pi Naut Service

[Service]
WorkingDirectory=/opt/pi-naut
ExecStart=startPiNaut.sh
ExecStop=stopPiNaut.sh

[Install]
WantedBy=multi-user.target
EOL
