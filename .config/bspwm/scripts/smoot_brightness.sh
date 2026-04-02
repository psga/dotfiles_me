#!/bin/bash
# Uso: smooth_brightness.sh [up/down]
STEP=1  # Cuántos pasos de 1% dará
SLEEP=0.01 # Velocidad de la transición (menos es más rápido)

if [ "$1" == "up" ]; then
    for i in {1..10}; do brightnessctl set +${STEP}% ; sleep $SLEEP; done
elif [ "$1" == "down" ]; then
    for i in {1..10}; do brightnessctl set ${STEP}%- ; sleep $SLEEP; done
fi
