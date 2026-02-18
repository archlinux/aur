# Maintainer: onxy <onxy@dev.vanta.app>
pkgname=vanta-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Liquid Glass command palette for Linux (Tauri v2 + Svelte 5)"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('vanta')
conflicts=('vanta')
# Data source: Release .deb
source=("https://github.com/Misiix9/vanta/releases/download/v${pkgver}/vanta_${pkgver}_amd64.deb")
sha256sums=('d575f4472b2f85a4b5fe9544495f742c0db0923bb469b0ea92b25c0ea5036742')

package() {
    # Extract data.tar.gz from the deb package
    tar -xzf data.tar.gz -C "$pkgdir"
}
