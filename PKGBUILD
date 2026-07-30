# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>

pkgname=zux-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="mDNS-SD Visualizer - A cross platform mDNS browsing visualizer written in Rust using tauri and svelte"
arch=('x86_64')
url="https://github.com/hrzlgnm/zux"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('zux')
source_x86_64=("https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/zux/releases/download/v$pkgver/zux_linux_x64")
sha256sums_x86_64=('4c413201307b2c557063fc528cc9f7a0305e1aa835a07ebd77a1a70519b5e46d' 'dd5721f154eeefafe4486f6f12100a7853401bde0fc908db9930cc38d83cef34')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 zux_linux_x64 "${pkgdir}/usr/bin/zux"
}
