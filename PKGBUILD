# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=0.19.3
pkgrel=1
pkgdesc="A cross platform mDNS-Browser app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb")
sha256sums_x86_64=('125f9c88b2d75c856ad41af9da660c114dd5dce2915f3a0a06e592c0aa4af297')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
}
