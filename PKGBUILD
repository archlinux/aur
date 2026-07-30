# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('139498e7880f21de0ff59fc3590653fbb6e4399a354623386bab365f568aaa25' 'f3aaf0f23ea075e912675e2a4ac9ed0d0e91651d2580f9e2b9b96d0197c73e5e')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
