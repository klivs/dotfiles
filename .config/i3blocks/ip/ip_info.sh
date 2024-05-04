#!/bin/bash

# Get total RAM and used RAM
total_ram=$(free -h | grep Mem | awk '{print $2}')
used_ram=$(free -h | grep Mem | awk '{print $3}')

# Output RAM information in the format i3blocks expects
echo ":" `hostname -I`
external_ip=$(wget -q -O - checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
	dunstify "IP Address Info" "External IP: ${external_ip}" 
fi
