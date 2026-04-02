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
-   **New Value**: `0`

*(This will override some white borders or heavy separations between content in some tabs).*

---

## 2. Quick Screenshots (Flameshot)

For quick documentation and snips, Flameshot is relied upon, featuring a GUI overlaid on top of the Window Manager in real-time.

They are initialized in `~/.config/flameshot/flameshot.ini`, but its main interaction is using the assigned shortcut for its on-screen GUI functions:

**In sxhkd:**
```sxhkdrc
super + shift + s
	flameshot gui
```
