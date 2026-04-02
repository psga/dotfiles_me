# Pablo's Dotfiles

Hello! This repository contains the configuration for my workspace. It is designed for a fast, productive, and minimalist environment using Arch Linux alongside lightweight tools.

![Example Screenshot](https://raw.githubusercontent.com/baskerville/bspwm/master/examples/desktop.png) <!-- Replace this with your own if you have one -->

## Main Stack

- **OS:** Arch Linux
- **Window Manager:** [bspwm](https://github.com/baskerville/bspwm)
- **Keybindings:** [sxhkd](https://github.com/baskerville/sxhkd)
- **Terminal:** [kitty](https://sw.kovidgoyal.net/kitty/)
- **Editor:** Neovim / VSCode
- **App Launcher:** dmenu

---

## Repository Structure

To prevent this main guide from becoming too long, the documentation is divided into submodules by topic. Click on the links to see how each aspect of this environment is configured:

1. [01 - Window Manager and Environment (bspwm, sxhkd, polybar)](docs/01-window-manager.md)
   - Details on X11 rules, bspwmrc, sxhkd shortcuts, and dark themes (GTK).
2. [02 - Terminal and Editors (kitty, (neo)vim, vscode, git)](docs/02-terminal-and-editors.md)
   - Font settings, clipboard synchronization, and themes.
3. [03 - System and Hardware (Battery, Touchpad, Audio)](docs/03-system-and-hardware.md)
   - TLP for battery saving, touchpad (`xorg.conf.d`), and volume control (`pamixer`/`brightnessctl`).
4. [04 - Other Applications (Browser, Screenshots)](docs/04-misc-apps.md)
   - Zen Browser, global custom fonts, NTFS support, and `flameshot`.

---

## Quick Installation

The best way to use these dotfiles is not to copy them directly, but to use symbolic links (`ln -s`) or utilities like [`stow`](https://www.gnu.org/software/stow/) so that changes in the repository update the system files on the fly.

```bash
# 1. Clone the repository
git clone <REPOSITORY_URL> ~/dotfiles

# 2. Create symbolic links for your files (classic example)
ln -sf ~/dotfiles/.config/bspwm ~/.config/bspwm
ln -sf ~/dotfiles/.config/sxhkd ~/.config/sxhkd
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.Xresources ~/.Xresources
```

> [!NOTE]
> Check the [Arch Wiki documentation](https://wiki.archlinux.org/title/Dotfiles) to learn why it's a good idea to organize your configurations this way.

### Immediate Dependencies

For the core components (`bspwm` and `sxhkd`, as well as their basic complements) to work instantly, you will need:

```bash
sudo pacman -S bspwm sxhkd kitty xorg-server xorg-xinit dmenu
```

Read the documentation in the `docs/` folder to see specific dependencies (like `pamixer`, `brightnessctl`, etc.).

---

**Important Note regarding `bspwmrc`**: Currently, the base configuration assumes you have some custom scripts and packages that may not be installed or are missing from this repository. Verify the following when initializing your environment:
- `~/.config/polybar/launch.sh` (if you use Polybar, make sure to add it to `.config/polybar`).
- `~/.config/bspwm/scripts/monitor_setup.sh` and `hot_corner_bar.sh` (if they are missing, remove them from `bspwmrc` or host them).
- `~/.config/sxhkd/scripts/volume.sh`.
