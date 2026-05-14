#!/usr/bin/env bash

SINK=59
PORT=$(pactl list sinks | grep "Active Port" | awk '{print $3}')

if [ "$PORT" = "analog-output-headphones" ]; then
  echo "🎧 Output: Headphones"
elif [ "$PORT" = "analog-output-lineout" ]; then
  echo "🔊 Output: Line-out"
else
  echo "🔈 Output: Unknown"
fi
