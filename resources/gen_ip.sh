#!/bin/bash

ip="$1"

convert -size 120x18 -pointsize 12 \
   	xc:black -font Bookman-DemiItalic -fill white \
    -gravity center -draw "text 0,0 '$ip'" ip.png

