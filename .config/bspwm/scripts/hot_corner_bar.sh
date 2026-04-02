#!/bin/bash
trap 'exit' SIGTERM
ESTADO="visible"

while pgrep -x bspwm > /dev/null; do
    eval $(xdotool getmouselocation --shell)
    WIDTH=$(xdotool getdisplaygeometry | awk '{print $1}')
    UMBRAL=$((WIDTH - 50))
    

    # MOSTRAR: Solo si el mouse está en la esquina Y el estado era oculto
    if [ "$Y" -le 5 ] && [ "$X" -ge $UMBRAL ]; then
        if [ "$ESTADO" == "oculto" ]; then
	    xdo raise -N Polybar
            polybar-msg cmd show > /dev/null
            ESTADO="visible"
        fi
    fi

    # OCULTAR: Solo si el mouse baja Y el estado era visible
    if [ "$Y" -gt 40 ]; then
        if [ "$ESTADO" == "visible" ]; then
            polybar-msg cmd hide > /dev/null
            ESTADO="oculto"
        fi
    fi

    sleep 0.2
done
