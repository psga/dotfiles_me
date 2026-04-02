# 01 - Window Manager and Environment

This environment uses a tiling philosophy thanks to `bspwm`, utilizing `sxhkd` to register keystrokes.

---

## 1. Monitor, X11 Performance, and Appearance

### Xresources (Display DPI)

If you notice that fonts or interfaces are incorrectly sized, you can force it in X11.

**File:** `~/.Xresources`
```xresources
Xft.dpi: 96
Xft.autohint: 0
Xft.lcdfilter: lcddefault
Xft.hintstyle: hintfull
Xft.hinting: 1
Xft.antialias: 1
```

**To apply changes on the fly:**
```bash
xrdb -merge ~/.Xresources
# Handy one-liner:
echo "Xft.dpi: 96" | xrdb -merge
```

### Global Dark Mode (GTK3)

Base configuration to prevent applications from clashing with a dark wallpaper.

**File:** `~/.config/gtk-3.0/settings.ini`
```ini
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
```

---

## 2. Window Manager (`bspwm`)

> [!NOTE]
> `bspwm` will not handle keyboard inputs; we delegate that completely to `sxhkd`.

**Main File:** `~/.config/bspwm/bspwmrc`

It is important to highlight the applied rules that modify how various windows interact:

- **Active Monitors:** Preconfigured to assign workspaces (I to X).
- **Polybar:** Set to ignore bspwm so it is not wrapped in its tile layer (`bspc rule -a Polybar manage=off border=off layer=above`).
- **Floating Behaviors (`floating`):** Certain applications are configured to open floating by default, such as `kitty`, `Gimp`, and even `mplayer2`.
- **Important Dependencies and Autostart:**
  Our `bspwmrc` is responsible for starting:
  1. `sxhkd` daemon.
  2. Keyboard layout mapped to Latin America (`latam`).
  3. `picom` (For rendering, like transparencies or animations - optional).
  4. System Bar: calls `~/.config/polybar/launch.sh --colorblocks`.
  5. Extra monitoring and "hot corners" scripts (e.g.: `monitor_setup.sh`, `hot_corner_bar.sh`).

---

## 3. Hotkeys (`sxhkd`)

**File:** `~/.config/sxhkd/sxhkdrc`

- **Basic Execution:** Auto-starts from `bspwmrc`. To force it to reload this configuration file instantly: `super + Escape`.
- **Application Launcher:** Used with a modified dark style.
  `super + @space` launches:
  `dmenu_run -nb '#000000' -nf '#FFFFFF' -sb '#FFFFFF' -sf '#000000' -fn 'Terminus:size=8'`

#### Key Shortcuts in bspwm:

| Action | Shortcut |
| :--- | :--- |
| **New Terminal (kitty)** | `super + Return` |
| **Close window / Kill** | `super + w` / `super + shift + w` |
| **Toggle Layout (Monocle)** | `super + m` |
| **Modify Window State** | `super + {t, shift+t, s, f}` (tiled, pseudo, floating, fullscreen) |
| **Change focus direction** | `super + {h, j, k, l}` |
| **Send to workspace {1-9}** | `super + shift + {1,2,3...}` |
| **Resize (alt)** | `super + alt + {h, j, k, l}` and reverse with `shift` |

---

> [!TIP]
> If you ever find yourself unable to control windows initially in bspwm, open an emergency terminal via `Ctrl + Alt + F2`, log in to the TTY, and inspect if dependencies (like `sxhkd` and `xdo`) are ready.
