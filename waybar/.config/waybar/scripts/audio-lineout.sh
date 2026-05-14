#!/usr/bin/env bash
SINK=$(pactl info | awk -F': ' '/Default Sink/ {print $2}')

pactl set-sink-port "$SINK" analog-output-lineout || exit 1

sleep 0.2
for i in $(pactl list sink-inputs short | awk '{print $1}'); do
  pactl move-sink-input "$i" "$SINK"
done
