# Maintainer: Valentin Batz <valentin.batz+archlinux@posteo.de>
pkgname=mdns-browser-bin
pkgver=1.9.11
pkgrel=1
pkgdesc="A cross platform mDNS browsing app written in Rust using tauri and leptos "
arch=('x86_64')
url="https://github.com/hrzlgnm/mdns-browser"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
conflicts=('mdns-browser')
source_x86_64=("https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_${pkgver}_amd64.deb" "https://github.com/hrzlgnm/mdns-browser/releases/download/mdns-browser-v$pkgver/mdns-browser_linux_x64")
sha256sums_x86_64=('2e9f6298a49601affe9d368edd32e151bf63c683f2a6cc5a961c99b76a9e867e' 'ef47e53bc9ec035d990597dc723277dc45d83b67ad41d6ec8c8af199f5049cdc')
package() {
    tar -xz -f data.tar.gz -C "${pkgdir}"
    install -Dm755 mdns-browser_linux_x64 "${pkgdir}/usr/bin/mdns-browser"
}
