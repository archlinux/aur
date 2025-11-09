# notnative-app-bin# notnative-app-bin



NotNative binary package for Arch Linux (AUR).NotNative binary package for Arch Linux (AUR).



[🇪🇸 Español](README.es.md)[🇪🇸 Español](README.es.md)



## 📦 Installation## 📦 Installation



```bash```bash

# With an AUR helper# Con un AUR helper

yay -S notnative-app-binyay -S notnative-app-bin



# Or manually# O manualmente

git clone https://aur.archlinux.org/notnative-app-bin.gitgit clone https://aur.archlinux.org/notnative-app-bin.git

cd notnative-app-bincd notnative-app-bin

makepkg -simakepkg -si

``````



## 📋 Description## 📋 Descripción



NotNative is a note-taking application with Vim-like keybindings, integrated MCP server with 40+ automation tools, AI chat, and smart tag system.NotNative es una aplicación de toma de notas con atajos estilo Vim, servidor MCP integrado con 40+ herramientas de automatización, chat con IA y sistema de tags inteligente.



## ✨ Key Features (v0.1.6)## ✨ Características Principales (v0.1.6)



- **📝 Markdown Editor**: With Vim syntax and YAML frontmatter- **📝 Editor Markdown**: Con sintaxis Vim y frontmatter YAML

- **🔌 MCP Server**: 40+ automation tools (port 8788)- **🔌 Servidor MCP**: 40+ herramientas de automatización (puerto 8788)

- **🏷️ Smart Tags**: Clickable #tags anywhere, YAML format support- **�️ Tags Inteligentes**: #tags clickables en cualquier posición, soporte YAML

- **🎵 Music Player**: YouTube search, playlists, full controls- **�🎵 Reproductor de Música**: Búsqueda en YouTube, playlists, controles completos

- **🤖 AI Chat**: OpenAI API integration with advanced workflows- **🤖 Chat con IA**: Integración con OpenAI API y workflows avanzados

- **🔄 Real-time Sync**: Automatic file watcher- **🔄 Sincronización en tiempo real**: File watcher automático

- **🌍 i18n**: Spanish and English support- **🌍 i18n**: Soporte para español e inglés



## 🚀 Quick Start## 🚀 Uso Rápido



```bash```bash

# Launch the application# Iniciar la aplicación

notnative-appnotnative-app



# Control from terminal/waybar/hyprland# Control desde terminal/waybar/hyprland

notnative-control show      # Show windownotnative-control show      # Mostrar ventana

notnative-control hide      # Hide to backgroundnotnative-control hide      # Ocultar a segundo plano

notnative-control toggle    # Toggle visibilitynotnative-control toggle    # Alternar visibilidad

notnative-control quit      # Quit completelynotnative-control quit      # Cerrar completamente

``````



## 🔧 Waybar Integration## 🔧 Integración con Waybar



Add to your `~/.config/waybar/config`:Agrega a tu `~/.config/waybar/config`:



```json```json

{{

    "modules-right": ["custom/notnative", ...],    "modules-right": ["custom/notnative", ...],

        

    "custom/notnative": {    "custom/notnative": {

        "format": "📝",        "format": "📝",

        "on-click": "notnative-control toggle",        "on-click": "notnative-control toggle",

        "on-click-right": "notnative-control quit",        "on-click-right": "notnative-control quit",

        "tooltip": false        "tooltip": false

    }    }

}}

``````



## ⌨️ Hyprland Integration## ⌨️ Integración con Hyprland



Add to your `~/.config/hyprland/hyprland.conf`:Agrega a tu `~/.config/hyprland/hyprland.conf`:



``````

bind = SUPER, N, exec, notnative-control togglebind = SUPER, N, exec, notnative-control toggle

bind = SUPER_SHIFT, N, exec, notnative-control showbind = SUPER_SHIFT, N, exec, notnative-control show

``````



## 🔌 MCP Server## 🔌 Servidor MCP



The MCP server starts automatically on `http://localhost:8788` with 40+ tools:El servidor MCP se inicia automáticamente en `http://localhost:8788` con 40+ herramientas:



```bash```bash

# List all notes# Listar todas las notas

curl http://localhost:8788/notescurl http://localhost:8788/notes



# Create new note# Crear nueva nota

curl -X POST http://localhost:8788/notes \curl -X POST http://localhost:8788/notes \

  -H "Content-Type: application/json" \  -H "Content-Type: application/json" \

  -d '{"title": "My Note", "content": "Content"}'  -d '{"title": "Mi Nota", "content": "Contenido"}'



# Search notes by tags# Buscar notas por tags

curl "http://localhost:8788/search?q=%23python"curl "http://localhost:8788/search?q=%23python"



# View available MCP tools# Ver herramientas MCP disponibles

curl http://localhost:8788/toolscurl http://localhost:8788/tools

``````



## 🤖 AI Configuration## 🤖 Configuración de IA



To use AI chat, configure your OpenAI API key in the app:Para usar el chat con IA, configura tu API key de OpenAI en la app:



1. Open NotNative1. Abre NotNative

2. Go to "AI Chat" tab2. Ve a la pestaña "Chat IA"

3. Enter your API key in settings3. Introduce tu API key en configuración

4. Start chatting!4. ¡Empieza a chatear!



## 📚 Full Documentation## 📚 Documentación Completa



- [Main README](https://github.com/k4ditano/notnative-omarchy/blob/master/README.md)- [README Principal](https://github.com/k4ditano/notnative-omarchy/blob/master/README.md)

- [MCP Integration](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_INTEGRATION.md)- [Integración MCP](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_INTEGRATION.md)

- [MCP Tools Reference (40+)](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_TOOLS_REFERENCE.md)- [Referencia MCP Tools (40+)](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_TOOLS_REFERENCE.md)

- [cURL Examples](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/CURL_EXAMPLES.md)- [Ejemplos cURL](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/CURL_EXAMPLES.md)



## 🐛 Bug Reports## 🐛 Reporte de Bugs



https://github.com/k4ditano/notnative-omarchy/issueshttps://github.com/k4ditano/notnative-omarchy/issues



## 📄 License## 📄 Licencia



MIT - See [LICENSE](https://github.com/k4ditano/notnative-omarchy/blob/master/LICENSE)MIT - Ver [LICENSE](https://github.com/k4ditano/notnative-omarchy/blob/master/LICENSE)



## 👤 Maintainer## 👤 Mantenedor



- **k4ditano** <k4ditano@h2r.es>- **k4ditano** <k4ditano@h2r.es>

- GitHub: [@k4ditano](https://github.com/k4ditano)- GitHub: [@k4ditano](https://github.com/k4ditano)



------



**Note**: This is a precompiled binary package. For the latest version with all features, use this package.**Nota**: Este es un paquete binario precompilado. Para la última versión con todas las funcionalidades, usa este paquete.


