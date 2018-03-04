setxkbmap -layout dvorak -option ctrl:nocaps

if [ -f ~/.config/compton.conf ]; then
  compton --config ~/.config/compton.conf -b
fi

if [ -f ~/.logitech_trackball.sh ]; then
  source ~/.logitech_trackball.sh
fi

xrandr --output DP-5 --auto --right-of HDMI-0
