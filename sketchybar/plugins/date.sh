#!/bin/bash

sketchybar --animate tanh 10 \
           --set "$NAME" label="$(date +'%a %d %b  -  %I:%M %p')" \
                         update_freq="$((60 - $(date +%s) % 60))"
