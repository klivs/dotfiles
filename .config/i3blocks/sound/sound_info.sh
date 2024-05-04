#!/bin/bash

sound_info=$(amixer get Master | grep -oE '[0-9]{1,3}?%' | head -1)

volume=$(echo "$sound_info" | grep -oE '[0-9]{1,3}')

if [ "$volume" -eq 0 ]; then
    output=" $sound_info"
elif [ "$volume" -eq 100 ]; then
    output=" $sound_info"
elif [ "$volume" -gt 50 ]; then
    output=" $sound_info"
else
    output=" $sound_info"
fi

echo "$output"
sink_inputs=$(pactl list sink-inputs | grep 'Sink Input #' | awk '{print $3}' | sed 's/#//')

# Left Click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
	amixer -q sset Master 5%+
# Middle Click
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
	for sink_input in $sink_inputs; do pactl set-sink-input-mute $sink_input toggle; done
# Right Click
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
	amixer -q sset Master 5%-
fi
