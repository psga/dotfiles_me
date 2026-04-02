# 🚀 04 - Otras Aplicaciones

Ajustes extras y misceláneos de aplicaciones en uso del ecosistema actual de trabajo.

---

## 1. Navegador Web (Zen Browser / Firefox base)

Buscas que toda la interfaz gráfica, e incluso el HTML que es renderizado si es posible, siga la sintonía general de píxeles/tipografía con `Tamzen`.

Se requiere instalar la extensión global conocida como `Stylus` dentro de la tienda de add-ons e incorporar la siguiente regla general.

### Regla CSS para Tipografía Global

```css
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
```

### Configuración Interna

Dirígete en al buscador de URL escribiendo `about:config`:

-   **Variable**: `zen.theme.content-element-separation`
-   **Valor Nuevo**: `0`

*(Esto anulará algunos bordes blancos o separaciones pesadas en algunas tabs entre el contenido).*

---

## 2. Capturas de Pantalla Rápidas (Flameshot)

Para documentaciones rápidas y recortes se confía en Flameshot con un UI GUI superpuesta sobre el Window Manager en tiempo real.

Se levantan en `~/.config/flameshot/flameshot.ini`, pero su interacción principal es usar el atajo asignado a sus funciones GUI por pantalla:

**En sxhkd:**
```sxhkdrc
super + shift + s
	flameshot gui
```
