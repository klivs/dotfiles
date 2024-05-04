#!/bin/bash

# Get total RAM and used RAM
total_ram=$(free -h | grep Mem | awk '{print $2}')
used_ram=$(free -h | grep Mem | awk '{print $3}')

# Output RAM information in the format i3blocks expects
echo " $used_ram / $total_ram"
