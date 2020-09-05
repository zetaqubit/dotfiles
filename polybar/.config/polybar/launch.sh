#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
on_laptop=false

if [ "$on_laptop" = false ]; then
  # For dual-monitors
  polybar home0 &
  polybar home1 &
else
  # For laptop
  polybar laptop &
fi

echo "Polybar launched..."
