#!/bin/bash
# Fixes some post install stuff.

wget https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/startPiNaut.sh -P /opt/pi-naut/
wget https://raw.githubusercontent.com/jtoplak/pi-dev-day/master/stopPiNaut.sh -P /opt/pi-naut/
chmod +x /opt/pi-naut/stopPiNaut.sh
chmod +x /opt/pi-naut/startPiNaut.sh

cat > /etc/systemd/system/pi-naut.service << EOL
[Unit]
Description=Java Pi Naut Service

[Service]
WorkingDirectory=/opt/pi-naut
ExecStart=/opt/pi-naut/startPiNaut.sh
ExecStop=/opt/pi-naut/stopPiNaut.sh
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOL
