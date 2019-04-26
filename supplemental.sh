#!/bin/bash
# Fixes some post install stuff.

sudo wget -O startPiNaut.sh https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/startPiNaut.sh -P /opt/pi-naut/
sudo wget -O stopPiNaut.sh https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/stopPiNaut.sh -P /opt/pi-naut/
sudo chmod +x /opt/pi-naut/stopPiNaut.sh
sudo chmod +x /opt/pi-naut/startPiNaut.sh

cat > /etc/systemd/system/pi-naut.service << EOL
[Unit]
Description=Java Pi Naut Service

[Service]
WorkingDirectory=/opt/pi-naut
ExecStart=/opt/pi-naut/startPiNaut.sh
ExecStop=/opt/pi-naut/stopPiNaut.sh
SuccessExitStatus=143
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOL
