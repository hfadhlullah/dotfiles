#!/usr/bin/env bash

SINK=59
PORT=$(pactl list sinks | grep "Active Port" | awk '{print $3}')

if [ "$PORT" = "analog-output-headphones" ]; then
  pactl set-sink-port $SINK analog-output-lineout
else
  pactl set-sink-port $SINK analog-output-headphones
fi
