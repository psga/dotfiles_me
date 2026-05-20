# 04 - Other Applications

Extra and miscellaneous tweaks for applications currently used in the work ecosystem.

---

## 1. Web Browser (Zen Browser / Firefox base)

You aim for the entire graphical interface, and even the rendered HTML if possible, to follow the general pixel/typography vibe with `Tamzen`.

You need to install the global extension known as `Stylus` from the add-ons store and incorporate the following general rule.

### CSS Rule for Global Typography

```css
/* This applies the font to all elements on any page */
* {
    font-family: "Tamzen", monospace !important;
}

/* Optional: Adjust anti-aliasing to make bitmap fonts look sharp */
html {
    -webkit-font-smoothing: none;
    -moz-osx-font-smoothing: unset;
    text-rendering: crispEdges;
}
```

### Internal Configuration

Go to the URL search bar and type `about:config`:

-   **Variable**: `zen.theme.content-element-separation`
    -   **Value**: `0` *(This will override some white borders or heavy separations between content in some tabs).*

#### Battery & Performance Tweaks

-   **Variable**: `browser.tabs.unloadOnLowMemory`
    -   **Value**: `true` *(Unloads tabs when memory is low).*
-   **Variable**: `browser.low_memory_notifier_enabled`
    -   **Value**: `true` *(Enables low-memory notifications).*
-   **Variable**: `gfx.webrender.all`
    -   **Value**: `true` *(Forces GPU WebRender system-wide for smoother performance).*
-   **Variable**: `accessibility.force_disabled`
    -   **Value**: `0`

#### Aesthetics

-   **Variable**: `widget.gtk.rounded-bottom-corners.enabled`
    -   *(Configure GTK rounded corners according to preference).*

---

## 2. Quick Screenshots (Flameshot)

For quick documentation and snips, Flameshot is relied upon, featuring a GUI overlaid on top of the Window Manager in real-time.

They are initialized in `~/.config/flameshot/flameshot.ini`, but its main interaction is using the assigned shortcut for its on-screen GUI functions:

**In sxhkd:**
```sxhkdrc
super + shift + s
	flameshot gui
```

---

## 3. Multimedia (Players & Editors)

For media playback and video editing, we use the following packages:

### Media Players (MPV & VLC)

To install the media players:
```bash
sudo pacman -S mpv vlc
```

### Video Editor (Shotcut)

To install the video editor:
```bash
sudo pacman -S shotcut
```

---

## 4. Fonts and Emojis

To enable proper emoji rendering system-wide, install Twemoji from the AUR:

```bash
yay -S ttf-twemoji
```
