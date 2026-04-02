#!/bin/bash
# volumen.sh
pamixer --list-sinks | grep -oP '^[0-9]+' | xargs -I{} pamixer --sink {} "$1" "$2"
