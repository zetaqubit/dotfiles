curr_monitor_id=$(aerospace list-monitors --focused --format %{monitor-id})
new_monitor_id=$((4 - $curr_monitor_id))  # toggles between 1 and 3
aerospace focus-monitor $new_monitor_id
