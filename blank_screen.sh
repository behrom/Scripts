#!/bin/bash

xrandr --output HDMI-1-2 --primary
xset dpms force off
xrandr --output LVDS1 --primary
xset dpms force off
