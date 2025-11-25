#!/bin/bash

# Script para crear el release de NotNative v0.1.5-preview
# Este script debe ejecutarse desde el directorio raíz del proyecto

VERSION="0.1.11"
TAG="v${VERSION}"
TARBALL="notnative-app-bin-${VERSION}-x86_64.tar.gz"

echo "📦 Creando release para NotNative ${VERSION}"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "notnative-app-bin/${TARBALL}" ]; then
    echo "❌ Error: No se encuentra el tarball en notnative-app-bin/${TARBALL}"
    echo "   Ejecuta este script desde el directorio raíz del proyecto"
    exit 1
fi

echo "✅ Tarball encontrado: notnative-app-bin/${TARBALL}"
echo ""

# Mostrar información del tarball
echo "📊 Información del tarball:"
ls -lh "notnative-app-bin/${TARBALL}"
echo ""
echo "🔐 Checksum SHA256:"
sha256sum "notnative-app-bin/${TARBALL}"
echo ""

# Instrucciones para crear el release en GitHub
echo "📝 Pasos para crear el release en GitHub:"
echo ""
echo "1. Ve a: https://github.com/k4ditano/notnative-omarchy/releases/new"
echo ""
echo "2. Crea un nuevo release con:"
echo "   - Tag: ${TAG}"
echo "   - Título: NotNative v0.1.5-preview"
echo "   - Descripción:"
echo ""
cat << 'EOF'
## 🎉 NotNative v0.1.5-preview

Esta es una versión preview con nuevas funcionalidades experimentales.

### ✨ Nuevas Características

- **🔄 Modo en segundo plano**: La aplicación permanece activa cuando se cierra la ventana
- **🎮 Sistema de control externo**: Control vía archivos (`notnative-control show|hide|toggle|quit`)
- **🔌 Servidor MCP integrado**: API REST para automatización externa
- **🎵 Reproductor de música mejorado**: Búsqueda en YouTube, playlists, controles completos
- **🤖 Chat con IA**: Integración con OpenAI API
- **🌍 Internacionalización**: Soporte completo para español e inglés
- **🔍 Detección de instancia única**: Previene múltiples instancias

### 📦 Instalación (Arch Linux)

```bash
# Instalar desde AUR
yay -S notnative-app-bin

# O instalar manualmente
pacman -U notnative-app-bin-0.1.5_preview-1-x86_64.pkg.tar.zst
```

### 🔧 Integración con Waybar

```json
{
    "custom/notnative": {
        "format": "📝",
        "on-click": "notnative-control toggle",
        "tooltip": false
    }
}
```

### 📚 Documentación

- [README](https://github.com/k4ditano/notnative-omarchy/blob/master/README.md)
- [MCP Integration](https://github.com/k4ditano/notnative-omarchy/blob/master/docs/MCP_INTEGRATION.md)
- [Background Control](https://github.com/k4ditano/notnative-omarchy/blob/master/docs/BACKGROUND_CONTROL.md)

### 🐛 Limitaciones Conocidas

- Sistema tray visual no disponible en Wayland (usar control por archivos)
- Requiere configuración manual de API key para funciones de IA

### 📊 Estadísticas del Proyecto

- **6000+ líneas** de código Rust
- **27 tests** pasando
- **30+ traducciones** (ES/EN)
- **4 módulos principales**: Editor, Música, IA, MCP
EOF
echo ""
echo "3. Sube el archivo: notnative-app-bin/${TARBALL}"
echo ""
echo "4. Marca como 'This is a pre-release'"
echo ""
echo "5. Publica el release"
echo ""

read -p "¿Quieres copiar el tarball a un directorio temporal? [s/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    mkdir -p /tmp/notnative-release
    cp "notnative-app-bin/${TARBALL}" /tmp/notnative-release/
    echo "✅ Tarball copiado a: /tmp/notnative-release/${TARBALL}"
    echo ""
    echo "Ahora puedes arrastrarlo a GitHub desde ese directorio"
fi

echo ""
echo "✨ ¡Listo! Sigue las instrucciones anteriores para completar el release"
