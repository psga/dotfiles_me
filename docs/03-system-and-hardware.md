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

## 2. Power Saving (TLP)

Smart resource saving management has been set up, mainly oriented for when the machine is running on Battery.

### TLP Utility Configured

The CPU `Governor` is manipulated if unplugged from power to preserve battery lifespan and prevent stagnation at 100% charge.

**File:** `/etc/tlp.conf`
```conf
CPU_SCALING_GOVERNOR_ON_BAT=powersave
CPU_ENERGY_PERF_POLICY_ON_BAT=power
START_CHARGE_THRESH_BAT0=75
STOP_CHARGE_THRESH_BAT0=80
```

### Passwordless Exceptions in `sudoers`

To be able to run TLP checks or restarts without annoying temporary password interruptions in scripts:

> [!WARNING]
> Be careful when doing this; a poorly configured visudo syntax can lock you out of root access. Always use `visudo` to check and save.

**Execution:** Use `sudo visudo` and place the exception referring to your user at the bottom (to prevent other variables from breaking your filter):

```sudoers
<your_user> ALL=(ALL) NOPASSWD: /usr/bin/tlp, /usr/bin/tlp-stat
```

---

## 3. Hardware Control via Keyboard

### Audio / Volume / Microphones (Via `pamixer` / scripts)

On combinations of Thinkpads (as notes indicate headphone output might be Sink 1 instead of 0), or normal computers, direct interaction happens through the `volume.sh` scripts.

```bash
sudo pacman -S pamixer
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
