#!/bin/bash
# Script de instalación automatizada de Vortex (AUR corregido)
# Versión: 2.1.0 | Fecha: 2026-05-22

set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC}  $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

check_root() {
    [[ $EUID -eq 0 ]] && error "No ejecutar como root. El script usará sudo cuando sea necesario."
}

install_deps() {
    info "Instalando dependencias del sistema..."
    local deps=(pnpm npm yarn dotnet-sdk-9.0 libappindicator python-setuptools git)
    sudo pacman -S --needed --noconfirm "${deps[@]}"
}

build_and_install() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    info "Iniciando build con makepkg..."
    cd "$script_dir"

    # Limpiar build anterior si existe
    rm -f ./*.pkg.tar.zst
    makepkg -s --noconfirm --needed

    local pkg
    pkg=$(ls ./*.pkg.tar.zst 2>/dev/null | head -1)
    [[ -z "$pkg" ]] && error "No se generó ningún paquete .pkg.tar.zst"

    info "Instalando paquete: $pkg"
    sudo pacman -U --noconfirm "$pkg"
}

apply_ext_patches() {
    info "Aplicando parches de extensiones Vortex..."
    for _p in /opt/Vortex/patch-ext-*.py; do
        [ -f "$_p" ] && python3 "$_p" 2>/dev/null
    done
    info "Parches aplicados (las extensiones no instaladas se saltarán)."
}

setup_nxm() {
    info "Configurando manejador de links NXM..."
    xdg-mime default vortex.desktop x-scheme-handler/nxm 2>/dev/null || \
        warn "No se pudo configurar NXM automáticamente. Ejecuta manualmente:"
    echo "  xdg-mime default vortex.desktop x-scheme-handler/nxm"
}

main() {
    info "=== Instalador de Vortex 2.0.0 (AUR fix) ==="
    check_root
    install_deps
    build_and_install
    apply_ext_patches
    setup_nxm
    info "=== Instalación completada. Ejecuta 'vortex' para iniciar. ==="
    info "Los parches BepInEx Linux también se aplicarán en cada inicio de Vortex."
}

main "$@"
