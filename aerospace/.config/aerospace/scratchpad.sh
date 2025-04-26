#!/usr/bin/env bash
#
# Emulates the i3 scratchpad functionality.

APP_ID=$1
APP_NAME=$2

focus_app() {
  current_workspace=$(aerospace list-workspaces --focused)
  app_window_id=$(aerospace list-windows --all --format "%{window-id}%{right-padding} | %{app-name}" | grep $APP_NAME | cut -d' ' -f1 | sed '1p;d')
  aerospace focus --window-id $app_window_id
  aerospace move-node-to-workspace $current_workspace
  aerospace workspace $current_workspace
  # aerospace move-mouse window-lazy-center
  # aerospace layout floating
}

app_closed() {
  if [ "$(aerospace list-windows --all --format '%{app-name}' | grep $APP_NAME)" == "" ]; then
    true
  else
    false
  fi
}

app_focused() {
  echo "$(aerospace list-windows --focused --format \"%{app-bundle-id}\")"
  if [ "$(aerospace list-windows --focused --format "%{app-bundle-id}")" == "$APP_ID" ]; then
    true
  else
    false
  fi
}

unfocus_app() {
  aerospace move-node-to-workspace scratchpad
}

if app_closed; then
  echo 'is closed'
  open -a $APP_NAME
  sleep 0.5
else
  if app_focused; then
    echo 'is focused'
    unfocus_app
  else
    echo 'is not focused'
    focus_app
  fi
fi
