# ⚡ Neovim & LazyVim Configuration

Configuración personalizada de **Neovim** basada en [LazyVim](https://github.com/LazyVim/LazyVim), optimizada para desarrollo ágil, transparencia visual e integración fluida con **Omarchy** o entornos independientes.

---

## 📁 Estructura del Proyecto

* **`init.lua`**: Punto de entrada de Neovim.
* **`bin/theme`**: Script que cambia el tema de Neovim, Ghostty y las apps GTK4/libadwaita (Nautilus) en un solo paso (ver [Gestión de Temas](#-gestión-de-temas-omarchy-vs-standalone)).
* **`extras/ghostty/themes/`**: Temas de Ghostty generados con las mismas paletas que `lua/themes/` (Ash, Last Horizon, Ryu, Solitude).
* **`lazy-lock.json`**: Versiones fijadas (commit hashes) de todos los plugins para garantizar una instalación 100% reproducible en cualquier máquina.
* **`lazyvim.json`**: Extras activos de LazyVim.
* **`lua/config/`**:
  * `lazy.lua`: Bootstrap y configuración del gestor de plugins `lazy.nvim`.
  * `options.lua`: Opciones generales de Vim (tabs, números de línea, etc.).
  * `keymaps.lua`: Atajos de teclado personalizados.
  * `autocmds.lua`: Comandos automáticos.
  * `remote_clipboard.lua`: Integración del portapapeles vía Wayland / OSC 52 (compatible con SSH y tmux).
* **`lua/plugins/`**:
  * Plugins específicos, ajustes de UI, transparencia (`lualine-transparent.lua`, `markdown.lua`, etc.).
  * `all-themes.lua`: Predeclaración de paletas para cambio rápido sin clonación en tiempo de ejecución.
  * `omarchy-theme-hotreload.lua`: Recarga en caliente del tema visual al cambiar de tema en Omarchy.
  * `theme.lua`: Tema activo. Es una copia de una receta de `lua/themes/` (lo escribe `bin/theme`); en Omarchy se reemplaza por un enlace.
* **`lua/themes/`**: Recetas portables e independientes de tus 10 temas favoritos:
  * `ryu.lua`: Paleta Aether personalizada con cursorline y detalles en naranja/oscuro.
  * `solitude.lua`: Paleta Ashen (`ashen.nvim`).
  * `kanagawa-dragon.lua`: Paleta Dragon (`kanagawa.nvim`).
  * `kanso.lua`: Paleta Kanso Zen (`kanso.nvim`).
  * `ash.lua`: Paleta minimalista monocromática Aether.
  * `last-horizon.lua`: Paleta sutil y oscura Aether.
  * `vesper.lua`: Casi monocromático con acentos naranja y menta (`vesper.nvim`).
  * `matte-black.lua`: Tema oficial de Omarchy, negro mate con acentos naranja (`matteblack.nvim`).
  * `vague.lua`: Colores apagados y desaturados (`vague.nvim`).
  * `miasma.lua`: Tonos tierra, verdes y marrones (`miasma.nvim`).
* **`plugin/after/transparency.lua`**: Reglas globales de transparencia para buffers y ventanas flotantes.

---

## 🛠️ Prerrequisitos en una Máquina Nueva

Antes de clonar la configuración, asegurate de tener instalado Neovim (versión >= 0.10) y las dependencias de compilación para Treesitter y los servidores LSP (Mason):

### Arch Linux / Omarchy:
```bash
sudo pacman -S neovim git gcc ripgrep fd make unzip
```

### Debian / Ubuntu:
```bash
sudo apt update && sudo apt install -y neovim git build-essential ripgrep fd-find unzip
```

### Fedora:
```bash
sudo dnf install -y neovim git gcc ripgrep fd-find make unzip
```

*(Opcional: tener `node` / `npm` o `python` si utilizás servidores LSP que dependen de esos entornos).*

### Terminal (opcional, recomendado):
* [Ghostty](https://ghostty.org) >= 1.2 (usa `~/.config/ghostty/config.ghostty`) para que la terminal comparta el tema con Neovim.
* `~/.local/bin` en tu `PATH` para poder ejecutar el comando `theme`.

---

## 🚀 Restauración Paso a Paso

1. **Clonar este repositorio en la ruta estándar de configuración:**
   ```bash
   git clone https://github.com/EliottV17/nvim.git ~/.config/nvim
   ```

2. **Abrir Neovim por primera vez:**
   ```bash
   nvim
   ```
   * En el primer inicio, `lazy.nvim` se descargará automáticamente de forma transparente.
   * Leerá `lazy-lock.json` e instalará en paralelo exactamente las mismas versiones de plugins que tenías en tu máquina anterior.
   * Treesitter compilará los parsers correspondientes.

3. **Verificar el estado del editor:**
   Dentro de Neovim, ejecutá:
   ```vim
   :checkhealth
   ```
   Esto te indicará si falta alguna herramienta externa del sistema (como `xclip`/`wl-copy`, linters o compiladores).

4. **Instalar el comando `theme` y sincronizar la terminal (sin Omarchy):**
   ```bash
   mkdir -p ~/.local/bin
   ln -s ~/.config/nvim/bin/theme ~/.local/bin/theme
   theme kanagawa-dragon   # o el tema que prefieras
   ```
   Ghostty se recarga solo; reiniciá Neovim. Si `~/.config/ghostty/config.ghostty` no existe, el script lo crea. También genera `~/.config/gtk-4.0/gtk.css` para que Nautilus use los mismos colores.

---

## 🎨 Gestión de Temas (Omarchy vs. Standalone)

Esta configuración está diseñada para funcionar en dos modalidades:

### 1. En sistemas con Omarchy
El repositorio guarda `theme.lua` como archivo normal (el tema standalone activo). En Omarchy, reemplazalo una vez por el enlace al estado de Omarchy:

```bash
ln -sf ~/.local/state/omarchy/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
```

Desde ahí, cuando ejecutás `omarchy theme set <nombre>`, Neovim actualiza los colores instantáneamente sin reiniciar el editor. No uses `bin/theme` en Omarchy: Omarchy ya gestiona el tema de la terminal. Para no subir ese enlace al repo, ejecutá `git update-index --assume-unchanged lua/plugins/theme.lua`.

### 2. En máquinas independientes (sin Omarchy)
Si estás en una laptop o servidor sin Omarchy, usá el script `bin/theme`. Cambia el tema de Neovim, el de Ghostty (y por lo tanto el de zsh) y los colores de Nautilus y demás apps GTK4/libadwaita en un solo paso.

Instalación (una sola vez):

```bash
ln -s ~/.config/nvim/bin/theme ~/.local/bin/theme
```

Uso:

```bash
theme              # lista los temas y muestra el actual
theme ryu          # activa Ryu en Neovim y Ghostty
theme kanagawa-dragon
```

Ghostty se recarga solo (el script le envía `SIGUSR2`, probado en Ghostty 1.3.1; si tu versión no lo soporta, usá `ctrl+shift+,`). Reiniciá Neovim para aplicar el tema ahí. Las demás opciones de `config.ghostty` se conservan; solo se reemplaza la línea `theme =`.

El script copia `lua/themes/<nombre>.lua` a `lua/plugins/theme.lua` y escribe la línea `theme = ...` en `~/.config/ghostty/config.ghostty`. Kanagawa Dragon, Kanso, Vesper, Matte Black, Vague y Miasma usan los temas que trae Ghostty; Ash, Last Horizon, Ryu y Solitude usan los archivos de `extras/ghostty/themes/`, generados con las mismas paletas que sus recetas de Neovim. zsh (o cualquier shell) toma los colores de la paleta de Ghostty, así que también cambia.

**Nautilus y apps GTK4/libadwaita:** el script también genera `~/.config/gtk-4.0/gtk.css` con los colores con nombre de libadwaita (`window_bg_color`, `accent_bg_color`, `headerbar_bg_color`, etc.), derivados del mismo tema de Ghostty: fondo, texto, rojo/verde/amarillo de la paleta y el color 4 como acento (Vesper usa su naranja, el color 11; se cambia en `gtk_accent_index_for()`). Afecta a todas las apps GTK4/libadwaita (Nautilus, Configuración, Editor de texto, etc.), no a apps GTK3, navegadores ni la barra de GNOME. Si Nautilus está abierto, el script lo cierra con `nautilus -q`; las demás apps toman los colores al reabrirlas. Si ya tenías un `gtk.css` propio, se guarda una copia `gtk.css.bak-<fecha>` antes del primer reemplazo. Para volver a los colores del sistema: `rm ~/.config/gtk-4.0/gtk.css`.

Cada cambio de tema modifica `lua/plugins/theme.lua`; hacé commit si querés que la próxima máquina arranque con ese tema.

**Agregar un tema nuevo:** creá `lua/themes/<nombre>.lua` y, si Ghostty no trae uno equivalente, `extras/ghostty/themes/<nombre>` (formato de config de Ghostty: `background`, `foreground`, `palette = 0..15`). Si Ghostty sí lo trae (`ghostty +list-themes`), agregá el mapeo en `ghostty_theme_for()` dentro de `bin/theme`.

---

## ⌨️ Atajos y Utilidades Frecuentes

* `<leader>l` o `:Lazy`: Panel de administración de plugins.
* `:Lazy sync`: Actualiza los plugins según el lockfile.
* `<leader>cm` o `:Mason`: Panel para instalar o actualizar Language Servers (LSP), Formatters y Linters.
* `<leader>ff`: Buscar archivos con Snacks / Telescope.
* `<leader>sg`: Búsqueda de texto (grep) en el proyecto.
