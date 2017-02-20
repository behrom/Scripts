#!/bin/bash

DIR="/home/Behrom/Pictures/Wallpapers"
TIME=3;

wallpaper() {
	wget https://source.unsplash.com/random/1366x768 -O "$DIR/background.jpg"
#	php /home/Behrom/Applications/Scripts/imagemerge.php $DIR/background.jpg
	gsettings set org.gnome.desktop.background picture-uri "file://$DIR/background.jpg"
}

screensaver() {
	wget https://source.unsplash.com/random/1366x768 -O "$DIR/screensaver.jpg"
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$DIR/screensaver.jpg"
}

loc() {
	PIC=$(ls $DIR/* | shuf -n1)
	gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

	PIC=$(ls $DIR/* | shuf -n1)
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$PIC"
}

if [ "$#" -ne 1 ]; then
	echo "Illegal number of parameters"
	echo "-l		use local photos"
	echo "-w		change wallpaper"
	echo "-s		change screensaver"
	echo "-ws or -sw	change both wallpaper and screensaver"
fi

case "$1" in
	"-l") 
		loc
		;;

	"-w") 
		wallpaper
		;;

	"-s") 
		screensaver
		;;
	
	"-ws" | "-sw")	
		wallpaper
		sleep $TIME
		screensaver
		;;
esac
