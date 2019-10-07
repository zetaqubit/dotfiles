# Mapped by kinesis.
#setxkbmap -layout dvorak -option ctrl:nocaps

if [ -f ~/.config/compton.conf ]; then
  compton --config ~/.config/compton.conf -b
fi

if [ -f ~/.config/logitech_trackball.sh ]; then
  source ~/.config/logitech_trackball.sh
fi

if [ -f ~/.config/split_ultrawide.sh ]; then
  source ~/.config/split_ultrawide.sh
fi

#xrandr --output DP-5 --auto --right-of HDMI-0
