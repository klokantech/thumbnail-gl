#!/bin/bash
set -e

xvfb-run -a -e /dev/stdout --server-args="-screen 0 1024x768x24" /usr/local/bin/thumbnails.sh "$1"
