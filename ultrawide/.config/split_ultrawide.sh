# Splits a 3440x1440 ultrawide into virtual displays, each of which acts
# as an independent i3 workspace.
# Modes (specified as 1st arg):
#   0: 1720x1440  1720x1440 (aka equal split mode)
#   1: 880x1440  2560x1440  (aka 16:9 video mode)
#   2: 3440x1440  (aka 21:9 movie mode)
#
# Source:
#  https://askubuntu.com/questions/150066/split-monitor-in-two/998435#998435
# Syntax for xrandr:
# xrandr --setmonitor "monitor_name" "width_px"/"width_mm"x"height_px"/"height_mm"+"x_offset_px"+"y_offset_px" "output_name" 

MONITOR=DP-0

if [ "$#" -eq 0 ] || [ "$1" -eq 0 ]; then
  echo "Setting mode 0"
  xrandr --delmonitor ${MONITOR}~0
  xrandr --delmonitor ${MONITOR}~1
  xrandr --setmonitor ${MONITOR}~0 1720/399x1440/335+0+0 ${MONITOR}
  xrandr --setmonitor ${MONITOR}~1 1720/399x1440/335+1720+0 none
elif [ "$1" -eq 1 ]; then
  echo "Setting mode 1"
  xrandr --delmonitor ${MONITOR}~0
  xrandr --delmonitor ${MONITOR}~1
  xrandr --setmonitor ${MONITOR}~0 880/204x1440/335+0+0 ${MONITOR}
  xrandr --setmonitor ${MONITOR}~1 2560/594x1440/335+880+0 none
elif [ "$1" -eq 2 ]; then
  echo "Setting mode 2"
  xrandr --delmonitor ${MONITOR}~0
  xrandr --delmonitor ${MONITOR}~1
  xrandr --setmonitor ${MONITOR}~0 3440/798x1440/335+0+0 ${MONITOR}
fi

xrandr --fb 3440x1440
