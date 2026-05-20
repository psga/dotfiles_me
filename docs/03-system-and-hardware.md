# 03 - System and Hardware

Configurations related to deeper OS and hardware support and interactions for your Arch machine.

---

## 1. Input Modules: Touchpad (Xorg)

To utilize tapping instead of physical buttons and enable "natural scrolling" (ideal if coming from other OSs), the main file is handled via *Xorg*.

**File:** `/etc/X11/xorg.conf.d/30-touchpad.conf`
*(Requires root privileges)*

```conf
Section "InputClass"
    Identifier "devname"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
EndSection
```

---

## 2. Power Profiles Daemon (`power-profiles-daemon`)

Instead of TLP, we use `power-profiles-daemon` to manage power profiles (performance, balanced, power-saver) natively.

### Installation and Enablement

```bash
sudo pacman -S power-profiles-daemon
sudo systemctl enable --now power-profiles-daemon
```

### Checking and Changing Profiles

To check the current status and profiles available:
```bash
powerprofilesctl
```

To set a specific profile manually:
```bash
powerprofilesctl set power-saver
```

---

## 3. Hardware Control via Keyboard

### Audio / Volume / Microphones (Via `pamixer` / scripts)

On combinations of Thinkpads (as notes indicate headphone output might be Sink 1 instead of 0), or normal computers, direct interaction happens through the `volume.sh` scripts. Ensure you have the audio packages (`pamixer` and `libpulse`) installed for proper sound and volume control:

```bash
sudo pacman -S pamixer libpulse
```

These shortcuts are linked in the `~/.config/sxhkd/sxhkdrc` file:
```sxhkdrc
XF86AudioLowerVolume  -> volume -d 5
XF86AudioRaiseVolume  -> volume -i 5
XF86AudioMute         -> volume -t
XF86AudioMicMute      -> /usr/bin/pamixer --default-source -t
```
> Verify the actual path of your volume file exists at: `~/.config/sxhkd/scripts/volume.sh`.

### Brightness (Via `brightnessctl`)

To increase or decrease illumination by exact percentage jumps, we forego custom scripts and call it directly in the Sxhkd block:

```sxhkdrc
# -- Brightness Control --
XF86MonBrightnessUp
    brightnessctl set +5%

XF86MonBrightnessDown
    brightnessctl set 5%-
```

(There used to be a previous alternative based on `light`/`brillo.sh`, but the current recommended native way is `brightnessctl`).

---

## 4. Extra Storage and USB Drives

When you dual boot or simply connect drives with Windows file formats to Arch Linux machines, you will critically need this for healthy mounting.

```bash
sudo pacman -S ntfs-3g fuse3
```
