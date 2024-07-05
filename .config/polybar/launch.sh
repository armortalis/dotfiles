!#/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc you can use
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Wait until the processes have been shut down 
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# for multimonitor
if type "xrandr"; then 
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload example & disown
	done
else
	polybar --reload example & disown
fi
