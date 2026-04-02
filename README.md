# 💻 Pablo's Dotfiles

¡Hola! Este repositorio contiene la configuración de mi entorno de trabajo. Está pensado para un entorno rápido, productivo y minimalista usando **Arch Linux** junto con herramientas ligeras.

![Screenshot de ejemplo](https://raw.githubusercontent.com/baskerville/bspwm/master/examples/desktop.png) <!-- Reemplaza esto con una tuya propia si tienes -->

## 🛠️ Stack Principal

- **OS:** Arch Linux.
- **Window Manager:** [bspwm](https://github.com/baskerville/bspwm)
- **Keybindings:** [sxhkd](https://github.com/baskerville/sxhkd)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Editor:** Neovim / VSCode
- **App Launcher:** dmenu

---

## 📂 Estructura del Repositorio

Para evitar que el manual sea muy largo en esta pantalla principal, la documentación está dividida en submódulos por temáticas. **Haz clic en el enlace para ver cómo está configurado cada aspecto de este entorno:**

1. 🪟 [01 - Window Manager y Entorno (bspwm, sxhkd, polybar)](docs/01-window-manager.md)
   - Detalles sobre reglas X11, bspwmrc, atajos en sxhkd, y temas oscuros (GTK).
2. 💻 [02 - Terminal y Editores (kitty, (neo)vim, vscode, git)](docs/02-terminal-and-editors.md)
   - Ajuste de fuentes, sincronización de portapapeles y temas.
3. ⚙️ [03 - Sistema y Hardware (Batería, Touchpad, Audio)](docs/03-system-and-hardware.md)
   - TLP para ahorrar batería, touchpad (`xorg.conf.d`), y volumen (`pamixer`/`brightnessctl`).
4. 🚀 [04 - Otras Aplicaciones (Navegador, Screenshots)](docs/04-misc-apps.md)
   - Zen Browser, tipografías personalizadas globales, NTFS y `flameshot`.

---

## 🚀 Instalación Rápida

La mejor forma de usar estos dotfiles no es copiarlos sin más, sino usar enlaces simbólicos (`ln -s`) o utilidades como [`stow`](https://www.gnu.org/software/stow/) para que los cambios en el repositorio actualicen los archivos del sistema al vuelo.

```bash
# 1. Clona el repositorio
git clone <URL_DEL_REPOSITORIO> ~/dotfiles

# 2. Crea enlaces simbólicos de tus archivos (ejemplo clásico)
ln -sf ~/dotfiles/.config/bspwm ~/.config/bspwm
ln -sf ~/dotfiles/.config/sxhkd ~/.config/sxhkd
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.Xresources ~/.Xresources
```

> [!NOTE]
> Revisa la [documentación de la Wiki de Arch](https://wiki.archlinux.org/title/Dotfiles) para enterarte por qué es buena idea organizar así tus configuraciones.

### Dependencias Inmediatas

Para que los componentes clave (`bspwm` y `sxhkd`, así como sus complementos básicos) funcionen al instante, vas a necesitar:

```bash
sudo pacman -S bspwm sxhkd kitty xorg-server xorg-xinit dmenu
```

Lee la documentación de la carpeta `docs/` para ver las dependencias específicas (como `pamixer`, `brightnessctl`, etc.).

---

**Nota Importante sobre `bspwmrc`**: Actualmente, la configuración base asume que tienes algunos scripts propios y paquetes que posiblemente no estén instalados, o no aparecen en este repositorio. Verifica lo siguiente al inicializar tu entorno:
- `~/.config/polybar/launch.sh` (si usas Polybar, asegúrate de añadirla a `.config/polybar`).
- `~/.config/bspwm/scripts/monitor_setup.sh` y `hot_corner_bar.sh` (si no están, remuévelos del `bspwmrc` o alójalos).
- `~/.config/sxhkd/scripts/volume.sh`.
