#!/bin/bash

DIR="/home/Behrom/Pictures/Wallpapers"

if [ $# -eq 1 ]; then 
	gsettings set org.gnome.desktop.background picture-uri "file://$DIR/$1"
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$DIR/$1"

else
	PIC=$(ls $DIR/* | shuf -n1)
	gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

	PIC=$(ls $DIR/* | shuf -n1)
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$PIC"
fi
