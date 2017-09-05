#!/bin/bash
set -e

echo "Starting..."

xvfb-run -a -e /dev/stdout --server-args="-screen 0 1024x768x24" /usr/local/bin/mbgl-render "$@"
