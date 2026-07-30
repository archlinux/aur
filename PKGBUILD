# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('ca81fe09fbfb3f27f14ad7912451427ef52fd1dd54ebdb2d6c354244a78ece52' 'bf02993c25b0cab55cc652935b7b773b32e9e4c47667549224d48f44b5e160e5')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
