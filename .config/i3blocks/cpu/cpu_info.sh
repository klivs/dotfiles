#!/bin/sh
TEMP=$(sensors | grep 'Tctl' | grep ':[ ]*+[0-9]*.[0-9]*°C' -o | grep '+[0-9]*.[0-9]*°C' -o)
CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {printf("%s", $(NF-9))}')
echo "$CPU_USAGE $TEMP" | awk '{ printf(":%5s% @ %s"), $1, $2 }'
