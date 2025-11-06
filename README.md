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

NotNative es una aplicación de toma de notas con atajos estilo Vim, servidor MCP integrado, chat con IA y reproductor de música.

## ✨ Características Principales

- **📝 Editor Markdown**: Con sintaxis Vim y frontmatter YAML
- **🔌 Servidor MCP**: API REST para automatización (puerto 3000)
- **🎵 Reproductor de Música**: Búsqueda en YouTube, playlists, controles completos
- **🤖 Chat con IA**: Integración con OpenAI API
- **🔄 Modo en segundo plano**: La app permanece activa cuando se cierra
- **🎮 Control externo**: `notnative-control show|hide|toggle|quit`
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

El servidor MCP se inicia automáticamente en `http://localhost:3000`:

```bash
# Listar todas las notas
curl http://localhost:3000/notes

# Crear nueva nota
curl -X POST http://localhost:3000/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "Mi Nota", "content": "Contenido"}'

# Buscar notas
curl "http://localhost:3000/search?q=python"
```

## 🤖 Configuración de IA

Para usar el chat con IA, configura tu API key de OpenAI en la app:

1. Abre NotNative
2. Ve a la pestaña "Chat IA"
3. Introduce tu API key en configuración
4. ¡Empieza a chatear!

## 📚 Documentación Completa

- [README Principal](https://github.com/k4ditano/notnative-omarchy/blob/master/README.md)
- [Integración MCP](https://github.com/k4ditano/notnative-omarchy/blob/master/docs/MCP_INTEGRATION.md)
- [Control en Segundo Plano](https://github.com/k4ditano/notnative-omarchy/blob/master/docs/BACKGROUND_CONTROL.md)

## 🐛 Reporte de Bugs

https://github.com/k4ditano/notnative-omarchy/issues

## 📄 Licencia

MIT - Ver [LICENSE](https://github.com/k4ditano/notnative-omarchy/blob/master/LICENSE)

## 👤 Mantenedor

- **k4ditano** <k4ditano@h2r.es>
- GitHub: [@k4ditano](https://github.com/k4ditano)

---

**Nota**: Este es un paquete binario precompilado. Para compilar desde el código fuente, usa el paquete `notnative-app` en AUR.
