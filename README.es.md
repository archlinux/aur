# notnative-app-bin

Paquete binario de NotNative para Arch Linux (AUR).

## 📦 Instalación

```bash
# Con un AUR helper
yay -S notnative-app-bin

# O manualmente
git clone https://aur.archlinux.org/notnative-app-bin.git
cd notnative-app-bin
makepkg -si
```

## 📋 Descripción

NotNative es una aplicación de toma de notas con atajos estilo Vim, servidor MCP integrado con 40+ herramientas de automatización, chat con IA y sistema de tags inteligente.

## ✨ Características Principales (v0.1.6)

- **📝 Editor Markdown**: Con sintaxis Vim y frontmatter YAML
- **🔌 Servidor MCP**: 40+ herramientas de automatización (puerto 8788)
- **🏷️ Tags Inteligentes**: #tags clickables en cualquier posición, soporte YAML
- **🎵 Reproductor de Música**: Búsqueda en YouTube, playlists, controles completos
- **🤖 Chat con IA**: Integración con OpenAI API y workflows avanzados
- **🔄 Sincronización en tiempo real**: File watcher automático
- **🌍 i18n**: Soporte para español e inglés

## 🚀 Uso Rápido

```bash
# Iniciar la aplicación
notnative-app

# Control desde terminal/waybar/hyprland
notnative-control show      # Mostrar ventana
notnative-control hide      # Ocultar a segundo plano
notnative-control toggle    # Alternar visibilidad
notnative-control quit      # Cerrar completamente
```

## 🔧 Integración con Waybar

Agrega a tu `~/.config/waybar/config`:

```json
{
    "modules-right": ["custom/notnative", ...],
    
    "custom/notnative": {
        "format": "📝",
        "on-click": "notnative-control toggle",
        "on-click-right": "notnative-control quit",
        "tooltip": false
    }
}
```

## ⌨️ Integración con Hyprland

Agrega a tu `~/.config/hyprland/hyprland.conf`:

```
bind = SUPER, N, exec, notnative-control toggle
bind = SUPER_SHIFT, N, exec, notnative-control show
```

## 🔌 Servidor MCP

El servidor MCP se inicia automáticamente en `http://localhost:8788` con 40+ herramientas:

```bash
# Listar todas las notas
curl http://localhost:8788/notes

# Crear nueva nota
curl -X POST http://localhost:8788/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "Mi Nota", "content": "Contenido"}'

# Buscar notas por tags
curl "http://localhost:8788/search?q=%23python"

# Ver herramientas MCP disponibles
curl http://localhost:8788/tools
```

## 🤖 Configuración de IA

Para usar el chat con IA, configura tu API key de OpenAI en la app:

1. Abre NotNative
2. Ve a la pestaña "Chat IA"
3. Introduce tu API key en configuración
4. ¡Empieza a chatear!

## 📚 Documentación Completa

- [README Principal](https://github.com/k4ditano/notnative-omarchy/blob/master/README.md)
- [Integración MCP](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_INTEGRATION.md)
- [Referencia MCP Tools (40+)](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/MCP_TOOLS_REFERENCE.md)
- [Ejemplos cURL](https://github.com/k4ditano/notnative-omarchy/blob/master/notnative-app/docs/CURL_EXAMPLES.md)

## 🐛 Reporte de Bugs

https://github.com/k4ditano/notnative-omarchy/issues

## 📄 Licencia

MIT - Ver [LICENSE](https://github.com/k4ditano/notnative-omarchy/blob/master/LICENSE)

## 👤 Mantenedor

- **k4ditano** <k4ditano@h2r.es>
- GitHub: [@k4ditano](https://github.com/k4ditano)

---

**Nota**: Este es un paquete binario precompilado. Para la última versión con todas las funcionalidades, usa este paquete.
