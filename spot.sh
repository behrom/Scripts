#!/bin/bash
Count=`ps -a | grep -c spotify`

if (($Count == 0))
then
	spotify
else
	echo "Window is exists"
	winid=`xwininfo -name Spotify |grep 'Window id:' |cut -d" " -f4`
	wmctrl -i -a "$winid"
fi

