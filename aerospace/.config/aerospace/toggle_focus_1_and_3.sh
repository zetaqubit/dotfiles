curr_monitor_id=$(aerospace list-monitors --focused --format %{monitor-id})
if [[ "$curr_monitor_id" -eq 1 || "$curr_monitor_id" -eq 3 ]]; then
  new_monitor_id=$((4 - $curr_monitor_id))  # toggles between 1 and 3
else
  new_monitor_id=1
fi
aerospace focus-monitor $new_monitor_id
