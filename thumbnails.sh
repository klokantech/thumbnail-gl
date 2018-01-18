#!/bin/sh

RENDER=/usr/local/bin/mbgl-render
CACHE=/var/cache.sqlite

$RENDER --cache $CACHE -s "$1" -x 0 -y 0 -z 0 -w 512 -h 512 -r 2 -o /data/thumbnail.png
$RENDER --cache $CACHE -s "$1" -x 10.987258 -y 46.453150 -z 4 -w 600 -h 400 -r 2 -o /data/preview-4.png
$RENDER --cache $CACHE -s "$1" -x 8.243967 -y 46.916315 -z 7 -w 600 -h 400 -r 2 -o /data/preview-7.png
$RENDER --cache $CACHE -s "$1" -x 8.619184 -y 47.336203 -z 10 -w 600 -h 400 -r 2 -o /data/preview-10.png
$RENDER --cache $CACHE -s "$1" -x 8.540587 -y 47.370555 -z 15 -w 600 -h 400 -r 2 -o /data/preview-15.png

if [ ! -z "$2" ]; then
  $RENDER --cache $CACHE -s "$1" $2 -o /data/custom.png
fi
