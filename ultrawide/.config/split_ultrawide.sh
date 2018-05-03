# Splits a 3440x1440 ultrawide into 2 virtual displays.
# This lets me independently control i3wm workspaces on left and right halves.
# Source:
#  https://askubuntu.com/questions/150066/split-monitor-in-two/998435#998435

# Syntax:
# xrandr --setmonitor "monitor_name" "width_px"/"width_mm"x"height_px"/"height_mm"+"x_offset_px"+"y_offset_px" "output_name" 

xrandr --setmonitor HDMI-0~0 1720/399x1440/167+0+0 HDMI-0
xrandr --setmonitor HDMI-0~1 1720/399x1440/168+1720+0 none
xrandr --fb 3440x1440
