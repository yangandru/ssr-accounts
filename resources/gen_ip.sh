#!/bin/bash

ip="$1"

convert -size 140x20 -pointsize 14 \
	xc:black -font Courier-Bold -fill white \
	-gravity center -draw "text 0,0 '$ip'" ip.png

