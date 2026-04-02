# 💻 02 - Terminal y Editores (Desarrollo)

La configuración base del flujo de trabajo se centra en un emulador de terminal avanzado (`kitty`), junto con herramientas y editores consistentes con la temática y atajos oscuros/minimalistas.

---

## 1. Terminal: Kitty

`kitty` es el emulador de terminal por defecto, soportando renderizado por GPU y altamente personalizable.

### Requisitos

```bash
sudo pacman -S kitty
```

### Configuración principal (`~/.config/kitty/kitty.conf`)

Destacan los siguientes aspectos de tu archivo por defecto:

```conf
font_family      tamzen
font_size        12.0
copy_on_select   yes
background       #000000
```
- **Tamaño y fuente:** `tamzen` tamaño `12`.
- **Comodidad extra:** `copy_on_select` está activo. Al seleccionar un texto en tu kitty se copia automáticamente sin tener que apretar nada.

---

## 2. Neovim / Vim (`~/.vimrc`)

Vim está configurado mediante un único archivo simple:

### Dependencias y Config

```bash
sudo pacman -S gvim
```

**Archivo:** `~/.vimrc`
```vim
syntax on
colorscheme quiet
set clipboard=unnamedplus
set nocompatible
filetype plugin indent on
```

- **`clipboard=unnamedplus`**: Super útil para sincronizar el copiado interno (usando `y`, `d`, y `p`) con el portapapeles del sistema X11, haciendo que copiar o pegar desde y hacia otras aplicaciones como el navegador sea limpio.
- **Tema**: `quiet`.

---

## 3. Visual Studio Code (`settings.json`)

Se ha procurado en el JSON de usuario de VSCode igualar mucho el estilo del terminal para que la vista del código se parezca a Kitty y Vim trabajando en paralelo.

### Configuración Recomendada de Code

Para coincidir con el resto, se usa lo siguiente:
- **Tema**: *Black Waves* (`orhun.black-waves` - necesitas instalar esta extensión de temas en VSCode).
- **Tipografía Compartida**: La fuente `Tamzen` que ya instalaste para Kitty, se declara también aquí (al igual que la configuración en los *Markdown Previews*).

**Ejemplo de Settings clave:**
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
Además de las variables de colores e interfaz (las cuales quitan distracciones a base de oscurecer toda la UI en `#000000`), el módulo `vim.useSystemClipboard` confirma que la integración de Vim sobre VSCode aprovecha el portapapeles universal.

---

## 4. Git Global Override

Para forzar el uso de SSH sobre HTTPS y mejorar los pushes a repositorios, el archivo de configuración global `.gitconfig` incluye o recomienda una reescritura de URLs nativa de Git.

```bash
# Asumiendo que ya tienes tu clave generada:
git config --global url."git@github.com:".insteadOf "https://github.com/"
```
Esto le indica al sub-sistema ssh que toda URL que Git intercepte como "https://github.com" intente rutearla a "git@github.com".
