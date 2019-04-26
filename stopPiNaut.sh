#!/bin/bash
if [[ ! -f "/opt/pi-naut/PI_NAUT_PID" && ! -s "/opt/pi-naut/PI_NAUT_PID" ]]; then
  echo "Pi Naut Service not running."
  exit 143;
fi
kill $(cat /opt/pi-naut/PI_NAUT_PID)
rm /opt/pi-naut/PI_NAUT_PID
