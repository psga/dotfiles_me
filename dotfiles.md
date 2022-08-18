bspwmrc y rxhkd
dpi 
echo "Xft.dpi: 96" | xrdb -merge

sxhdk
	dmenu_run -nb '#000000' -nf '#FFFFFF' -sb '#FFFFFF' -sf '#000000' -fn 'Terminus:size=8'
.Xresources para validar el dpi de Xfti. 
	xrdb -merge ~/.Xresources
	ademas puse .config/fontconfig/fonts.conf
		fc-cache -fu
kitty conf para la configuracion de terminal

	voy a hacer el script de brillo

modo oscuro .config/gtk-3.0/settings.ini

sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf

/etc/tlp.conf
	CPU_SCALING_GOVERNOR_ON_BAT=powersave
	CPU_ENERGY_PERF_POLICY_ON_BAT=power


ver porque visudo no cuenta tlp y solicita clave...
cambiar esto.
arreglado: era el orden de visudo cuando se dice que no tenga password para el comando y luego dice que pongale password se daña



# git 
clave ssh. y 
git config --global url."git@github.com:".insteadOf "https://github.com/"


# vim 
~/.vimrc
set clipboard=unnamedplus
sudo pacman -S gvim


syntax on
colorscheme quiet

# vscode 
cambiar vim copy paste

theme Black Waves
orhun.black-waves
vscodie settings:
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



Ver archivos ntfs
sudo pacman -S ntfs-3g fuse3

# zenbrowser
stylus extension para cambiar fuente


/* Esto aplica la fuente a todos los elementos de cualquier página */
* {
    font-family: "Tamzen", monospace !important;
}

/* Opcional: Ajustar el suavizado para que las fuentes bitmap se vean nítidas */
html {
    -webkit-font-smoothing: none;
    -moz-osx-font-smoothing: unset;
    text-rendering: crispEdges;
}


