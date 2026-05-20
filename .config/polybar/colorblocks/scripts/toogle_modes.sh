#!/bin/bash

# Get current profile using powerprofilesctl
CURRENT=$(powerprofilesctl get 2>/dev/null)

# Fallback if command fails or power-profiles-daemon is not running yet
if [ -z "$CURRENT" ]; then
    CURRENT="balanced"
fi

# If toggle argument is passed, cycle to the next mode
if [ "$1" == "--toggle" ]; then
    case "$CURRENT" in
        performance)
            NEXT="balanced"
            ;;
        balanced)
            NEXT="power-saver"
            ;;
        power-saver)
            NEXT="performance"
            ;;
        *)
            NEXT="balanced"
            ;;
    esac
    powerprofilesctl set "$NEXT" 2>/dev/null
    CURRENT="$NEXT"
fi

# Output the icon/label for polybar based on current profile
case "$CURRENT" in
    performance)
        echo "█"
        ;;
    balanced)
        echo "▒"
        ;;
    power-saver)
        echo "░"
        ;;
    *)
        echo "?"
        ;;
esac
