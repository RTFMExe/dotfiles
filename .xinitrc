# urxvt daemon 
urxvtd -o -f -q &

# autolock screen
xautolock -time 15 -locker slock &

# background
if [ -s $HOME/.setbg ]; then
    $HOME/.scripts/setbg.sh &
else
    xsetroot -solid \#7EC7FD &
fi

# dzen2
sleep 1 && .scripts/baraction.sh | dzen2 -p -fn "xos4 Terminus:pixelsize=12:antialias=true" -x 2280 -fg '#fff' -bg '#9d6d8d' -ta r &

# disable blank screen
xset s noblank
xset s -dpms

# wm
#spectrwm
while true; do
    dwm 2> ~/.dwm.log
done
