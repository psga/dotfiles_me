### Directiva de Configuración de Dotfiles (Arch + bspwm)

---

#### 1. X11 & UI Resources
**~/.Xresources**
```x11
Xft.dpi: 96
Xft.autohint: 0
Xft.lcdfilter: lcddefault
Xft.hintstyle: hintfull
Xft.hinting: 1
Xft.antialias: 1
```
**Ejecución:** `xrdb -merge ~/.Xresources`

**~/.config/gtk-3.0/settings.ini**
```ini
[Settings]
gtk-application-prefer-dark-theme=1
gtk-theme-name=Adwaita-dark
```

---

#### 2. Terminal & Editor (Sync Clipboard)
**Requisito:** `sudo pacman -S gvim kitty`

**~/.vimrc**
```vim
syntax on
colorscheme quiet
set clipboard=unnamedplus
set nocompatible
filetype plugin indent on
```

**~/.config/kitty/kitty.conf**
```conf
font_family      tamzen
font_size        12.0
copy_on_select   yes
background       #000000
```

---

#### 3. Hardware & Power Management
**/etc/X11/xorg.conf.d/30-touchpad.conf**
```conf
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

**/etc/tlp.conf**
```conf
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_ENERGY_PERF_POLICY_ON_BAT=power
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```

**/etc/sudoers (via visudo)**
```sudoers
# Mantener al final del archivo
<usuario> ALL=(ALL) NOPASSWD: /usr/bin/tlp, /usr/bin/tlp-stat
```

---

#### 4. Git & Storage
**Configuración Global:**
```bash
git config --global url."git@github.com:".insteadOf "https://github.com/"
sudo pacman -S ntfs-3g fuse3
```

---

#### 5. VSCode (settings.json)
```json
{
    "editor.fontFamily": "'tamzen'",
    "workbench.editor.enablePreview": false,
    "vim.useSystemClipboard": true,
    "workbench.colorTheme": "Black Waves",
    "workbench.colorCustomizations": {
        "titleBar.inactiveBackground": "#000000",
        "sideBar.inactiveBackground": "#000000",
        "sideBar.background": "#000000",
        "titleBar.activeBackground": "#000000",
        "activityBar.background": "#000000",
        "editor.background": "#000000"
    }
}
```

---

#### 6. Script de Brillo (`brillo.sh`)
```bash
#!/bin/bash
# Requisito: sudo pacman -S light
case $1 in
    up) light -A 5 ;;
    down) light -U 5 ;;
esac
```
**sxhkdrc integration:**
```conf
XF86MonBrightness{Up,Down}
    /path/to/brillo.sh {up,down}
```

