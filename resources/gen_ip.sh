#!/bin/bash

ip="$1"

convert -size 120x18 -pointsize 13 \
	xc:black -font Courier-Bold -fill white \
	-gravity center -draw "text 0,0 '$ip'" ip.png

