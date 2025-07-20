# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="A cross platform mDNS-Browser app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb")
sha256sums_x86_64=('8d8e30c6c8be0116456f0d82963e44232b5d14361225ceb2ffac1b33e0d9f10d')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
