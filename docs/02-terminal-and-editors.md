# 02 - Terminal and Editors (Development)

The base workflow configuration revolves around an advanced terminal emulator (`kitty`), alongside tools and editors consistent with the dark/minimalist theme and shortcuts.

---

## 1. Terminal: Kitty

`kitty` is the default terminal emulator, supporting GPU rendering and being highly customizable.

### Requirements

```bash
sudo pacman -S kitty
```

### Main Configuration (`~/.config/kitty/kitty.conf`)

Here are the standout aspects of your default file:

```conf
font_family      tamzen
font_size        12.0
copy_on_select   yes
background       #000000
```
- **Size and font:** `tamzen` size `12`.
- **Extra convenience:** `copy_on_select` is active. Selecting text in kitty automatically copies it without pressing any keys.

---

## 2. Neovim / Vim (`~/.vimrc`)

Vim is configured through a single simple file:

### Dependencies and Config

```bash
sudo pacman -S gvim
```

**File:** `~/.vimrc`
```vim
syntax on
colorscheme quiet
set clipboard=unnamedplus
set nocompatible
filetype plugin indent on
```

- **`clipboard=unnamedplus`**: Extremely useful for syncing internal copying (using `y`, `d`, and `p`) with the X11 system clipboard, making copy-pasting to and from other apps like the browser very clean.
- **Theme**: `quiet`.

---

## 3. Visual Studio Code (`settings.json`)

Effort has been made in the user JSON of VSCode to match the terminal's style so that the code view looks like Kitty and Vim working in parallel.

### Recommended Code Settings

To match the rest, the following is used:
- **Theme**: *Black Waves* (`orhun.black-waves` - you need to install this theme extension in VSCode).
- **Shared Typography**: The `Tamzen` font you already installed for Kitty is declared here too (as well as the settings for *Markdown Previews*).

**Key Settings Example:**
```json
{
    "editor.fontFamily": "'tamzen'",
    "workbench.editor.enablePreview": false,
    "markdown.preview.fontFamily": "'Tamzen', 'Terminal', monospace",
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
Besides the color and interface variables (which remove distractions by darkening the entire UI to `#000000`), the `vim.useSystemClipboard` module ensures that the Vim integration inside VSCode takes advantage of the universal clipboard.

---

## 4. Git Global Override

To force using SSH over HTTPS and improve pushes to repositories, the global `.gitconfig` file includes or recommends a native URL rewrite for Git.

```bash
# Assuming you already generated your key:
git config --global url."git@github.com:".insteadOf "https://github.com/"
```
This tells the ssh subsystem that every URL Git intercepts as "https://github.com" should be routed to "git@github.com".
