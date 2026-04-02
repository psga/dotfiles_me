#!/bin/bash

# Nombres de tus salidas (CÁMBIALOS si son diferentes en tu xrandr)
INTERNAL="eDP-1"
EXTERNAL="HDMI-1"

if xrandr | grep "$EXTERNAL connected"; then
    # 1. Configuración para MONITOR EXTERNO
    # Activa el externo a su resolución nativa y apaga la laptop (opcional)
    xrandr --output "$EXTERNAL" --auto --primary --output "$INTERNAL" --off
    
    # 2. Resetear DPI a lo normal (96 es el estándar de Windows/Linux)
    echo "Xft.dpi: 96" | xrdb -merge

else
    # 1. Configuración para PORTÁTIL
    xrandr --output "$INTERNAL" --auto --primary --output "$EXTERNAL" --off
    
    # 2. Aplicar tu DPI preferido para la laptop (el que te gustó)
    echo "Xft.dpi: 75" | xrdb -merge

fi
