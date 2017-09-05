#!/bin/sh

RENDER=/usr/local/bin/mbgl-render

$RENDER -s "$1" -x 0 -y 0 -z 0 -w 512 -h 512 -r 2 -o thumbnail.png
$RENDER -s "$1" -x 8.5456 -y 47.3739 -z 10 -w 640 -h 360 -o preview-10.png
$RENDER -s "$1" -x 8.5456 -y 47.3739 -z 2 -w 640 -h 360 -o preview-2.png
