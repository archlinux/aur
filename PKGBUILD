# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=0.21.10
pkgrel=1
pkgdesc="A cross platform mDNS-Browser app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb")
sha256sums_x86_64=('367a097a369079f18fbd20f05bb8a62d3106f6a991e99677fe9b3c9e3e1b4aa8')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
