# ⚡ Neovim & LazyVim Configuration

Configuración personalizada de **Neovim** basada en [LazyVim](https://github.com/LazyVim/LazyVim), optimizada para desarrollo ágil, transparencia visual e integración fluida con **Omarchy** o entornos independientes.

---

## 📁 Estructura del Proyecto

* **`init.lua`**: Punto de entrada de Neovim.
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
  * `theme.lua`: Enlace o definición del tema activo.
* **`lua/themes/`**: Recetas portables e independientes de tus 6 temas favoritos:
  * `ryu.lua`: Paleta Aether personalizada con cursorline y detalles en naranja/oscuro.
  * `solitude.lua`: Paleta Ashen (`ashen.nvim`).
  * `kanagawa-dragon.lua`: Paleta Dragon (`kanagawa.nvim`).
  * `kanso.lua`: Paleta Kanso Zen (`kanso.nvim`).
  * `ash.lua`: Paleta minimalista monocromática Aether.
  * `last-horizon.lua`: Paleta sutil y oscura Aether.
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

---

## 🚀 Restauración Paso a Paso

1. **Clonar este repositorio en la ruta estándar de configuración:**
   ```bash
   git clone <URL_DE_TU_REPOSITORIO> ~/.config/nvim
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

---

## 🎨 Gestión de Temas (Omarchy vs. Standalone)

Esta configuración está diseñada para funcionar en dos modalidades:

### 1. En sistemas con Omarchy
No tenés que hacer nada. `theme.lua` se enlaza con el estado de Omarchy y, cuando ejecutás `omarchy theme set <nombre>`, Neovim actualiza los colores instantáneamente sin reiniciar el editor.

### 2. En máquinas independientes (sin Omarchy)
Si estás en una laptop o servidor sin Omarchy, podés activar cualquiera de los 6 temas incluidos reemplazando `theme.lua` con la receta correspondiente:

```bash
# Ejemplo para activar Ryu:
cp ~/.config/nvim/lua/themes/ryu.lua ~/.config/nvim/lua/plugins/theme.lua

# Ejemplo para activar Solitude:
cp ~/.config/nvim/lua/themes/solitude.lua ~/.config/nvim/lua/plugins/theme.lua

# Ejemplo para activar Kanagawa Dragon:
cp ~/.config/nvim/lua/themes/kanagawa-dragon.lua ~/.config/nvim/lua/plugins/theme.lua

# Ejemplo para activar Kanso:
cp ~/.config/nvim/lua/themes/kanso.lua ~/.config/nvim/lua/plugins/theme.lua

# Ejemplo para activar Ash:
cp ~/.config/nvim/lua/themes/ash.lua ~/.config/nvim/lua/plugins/theme.lua

# Ejemplo para activar Last Horizon:
cp ~/.config/nvim/lua/themes/last-horizon.lua ~/.config/nvim/lua/plugins/theme.lua
```

---

## ⌨️ Atajos y Utilidades Frecuentes

* `<leader>l` o `:Lazy`: Panel de administración de plugins.
* `:Lazy sync`: Actualiza los plugins según el lockfile.
* `<leader>cm` o `:Mason`: Panel para instalar o actualizar Language Servers (LSP), Formatters y Linters.
* `<leader>ff`: Buscar archivos con Snacks / Telescope.
* `<leader>sg`: Búsqueda de texto (grep) en el proyecto.
