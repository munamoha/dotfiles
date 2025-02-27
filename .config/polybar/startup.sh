#!/usr/bin/env bash

# waiting to see if other stuff loaded
sleep 1

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch polybar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "polybar launched :]"
