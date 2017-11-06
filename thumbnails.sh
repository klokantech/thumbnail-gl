#!/bin/sh

RENDER=/usr/local/bin/mbgl-render
CACHE=/var/cache.sqlite

$RENDER --cache $CACHE -s "$1" -x 0 -y 0 -z 0 -w 512 -h 512 -r 2 -o /data/thumbnail.png
$RENDER --cache $CACHE -s "$1" -x 8.5456 -y 47.3739 -z 10 -w 640 -h 360 -o /data/preview-10.png
$RENDER --cache $CACHE -s "$1" -x 8.5456 -y 47.3739 -z 2 -w 640 -h 360 -o /data/preview-2.png

if [ ! -z "$2" ]; then
  $RENDER --cache $CACHE -s "$1" $2 -o /data/custom.png
fi
