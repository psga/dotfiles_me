# ⚙️ 03 - Sistema y Hardware

Configuraciones relacionadas al soporte e interacciones más profundas del sistema operativo y hardware de tu máquina Arch.

---

## 1. Módulos de Entrada: Touchpad (Xorg)

Para aprovechar los toques en lugar de botones físicos y habilitar un "scroll natural" (ideal si vienes de otros SO), el archivo principal se maneja sobre *Xorg*.

**Archivo:** `/etc/X11/xorg.conf.d/30-touchpad.conf`
*(Requiere permisos root)*

```conf
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

---

## 2. Ahorro de Energía (TLP)

Se ha configurado un manejo inteligente de ahorro de recursos, orientado fundamentalmente cuando el equipo usa Batería. 

### Utilidad TLP Configurada

Se manipula el `Governor` en CPU si está sin cable de energía para preservar vida útil y no estancar la carga a 100%.

**Archivo:** `/etc/tlp.conf`
```conf
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_ENERGY_PERF_POLICY_ON_BAT=power
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```

### Excepciones en `sudoers` sin Contraseña

Para poder correr revisiones o reinicios de TLP sin molestas interrupciones por password temporal en scripts:

> [!WARNING]
> Ten cuidado al hacer esto; si el formato se daña usar un visudo mal configurado puede dejarte sin root. Siempre usa `visudo` para comprobar y guardar.

**Ejecución:** Usa `sudo visudo` y coloca la excepción que se refiera a tu usuario en la base, abajo del todo (para evitar que otras variables rompan tu filtro):

```sudoers
<tu_usuario> ALL=(ALL) NOPASSWD: /usr/bin/tlp, /usr/bin/tlp-stat
```

---

## 3. Control de Hardware por Teclado

### Audio / Volúmen / Micrófonos (Vía `pamixer` / scripts)

En combinaciones de Thinkpads (como indica las notas que la salida de auriculares sea el Sink 1 en vez del 0), o computadoras normales, se interactúa directo con los scripts `volume.sh`.

```bash
sudo pacman -S pamixer
```

Estos atajos se enlazan en el archivo `~/.config/sxhkd/sxhkdrc`:
```sxhkdrc
XF86AudioLowerVolume  -> volume -d 5
XF86AudioRaiseVolume  -> volume -i 5
XF86AudioMute         -> volume -t
XF86AudioMicMute      -> /usr/bin/pamixer --default-source -t
```
> Revisa la ruta real de tu archivo de volumen que esté existiendo en: `~/.config/sxhkd/scripts/volume.sh`.

### Brillo (Vía `brightnessctl`)

Para aumentar o reducir la iluminación por saltos porcentuales justos, prescindimos de scripts custom y llamamos directamente en el bloque Sxhkd:

```sxhkdrc
# -- Brightness Control --
XF86MonBrightnessUp
    brightnessctl set +5%

XF86MonBrightnessDown
    brightnessctl set 5%-
```

(Tenían una alternativa previa basada en `light`/`brillo.sh`, pero la actual recomendada nativa es `brightnessctl`).

---

## 4. Almacenamiento Adicional y Memorias USB

Cuando tienes Dual boot o simplemente conectas discos con formatos de archivo de Windows a las computadoras de ArchLinux, requerirás esto de forma vital para monturas sanas.

```bash
sudo pacman -S ntfs-3g fuse3
```
