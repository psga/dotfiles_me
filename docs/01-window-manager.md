# 🪟 01 - Window Manager y Entorno

Este entorno utiliza una filosofía tiling gracias a `bspwm`, utilizando `sxhkd` para registrar las teclas.

---

## 1. Monitor, Rendimiento X11 y Apariencia

### Xresources (DPI de Pantalla)

Si notas que las fuentes o interfaces están mal dimensionadas, se puede forzar en X11.

**Archivo:** `~/.Xresources`
```xresources
Xft.dpi: 96
Xft.autohint: 0
Xft.lcdfilter: lcddefault
Xft.hintstyle: hintfull
Xft.hinting: 1
Xft.antialias: 1
```

**Para aplicar cambios en caliente:**
```bash
xrdb -merge ~/.Xresources
# Tip práctico de una sola línea:
echo "Xft.dpi: 96" | xrdb -merge
```

### Modo Oscuro Global (GTK3)

Configuración base para evitar que las aplicaciones desentonen de un fondo de pantalla oscuro.

**Archivo:** `~/.config/gtk-3.0/settings.ini`
```ini
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
```

---

## 2. Window Manager (`bspwm`)

> [!NOTE]
> `bspwm` no manejará las pulsaciones del teclado; eso lo delegamos totalmente a `sxhkd`.

**Archivo Principal:** `~/.config/bspwm/bspwmrc`

Es importante destacar las reglas aplicadas que modifican cómo interactúan varias ventanas:

- **Monitores Activos:** Preconfigurados para asignar espacios de trabajo (I a X).
- **Barra Polybar:** Se establece para ignorar a bspwm y que no la envuelva en su capa de tiles (`bspc rule -a Polybar manage=off border=off layer=above`).
- **Comportamientos Flotantes (`floating`):** Ciertas aplicaciones están configuradas para abrir flotando por defecto como `kitty` o `Gimp` e incluso `mplayer2`.
- **Dependencias Importantes y Autostart:**
  Nuestro `bspwmrc` es responsable de arrancar:
  1. Daemon de `sxhkd`.
  2. Distribución de teclado mapeado a Latinoamérica (`latam`).
  3. `picom` (Para la renderización, como transparencias o animaciones - opcional).
  4. Barra de Sistema: llama a `~/.config/polybar/launch.sh --colorblocks`.
  5. Scripts extra de monitoreo y "hot corners" (p.ej.: `monitor_setup.sh`, `hot_corner_bar.sh`).

---

## 3. Teclas Rápidas (`sxhkd`)

**Archivo:** `~/.config/sxhkd/sxhkdrc`

- **Ejecución básica:** Se auto-arranca desde `bspwmrc`. Para forzar a que recargue este mismo archivo al instante: `super + Escape`.
- **Lanzador de Aplicaciones:** Se utiliza modificado para estilo oscuro.
  `super + @space` lanza:
  `dmenu_run -nb '#000000' -nf '#FFFFFF' -sb '#FFFFFF' -sf '#000000' -fn 'Terminus:size=8'`

#### Atajos Clave en bspwm:

| Acción | Atajos |
| :--- | :--- |
| **Nueva Terminal (kitty)** | `super + Return` |
| **Cerrar ventana / Matar** | `super + w` / `super + shift + w` |
| **Alternar Layout (Monocle)** | `super + m` |
| **Modificar Estado de Ventana** | `super + {t, shift+t, s, f}` (tiled, pseudo, floating, fullscreen) |
| **Cambiar foco dirección** | `super + {h, j, k, l}` |
| **Enviar a escritorio {1-9}** | `super + shift + {1,2,3...}` |
| **Redimensionar (alt)** | `super + alt + {h, j, k, l}` y reversa con `shift` |

---

> [!TIP]
> Si en algún caso te encuentras sin poder controlar las ventanas desde un inicio en bspwm, abre una terminal de emergencia vía `Ctrl + Alt + F2`, logueate en terminal e inspecciona si las dependencias (como `sxhkd` y `xdo`) están listas.
