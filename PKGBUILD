# Maintainer: acgq <acgq@users.noreply.github.com>

pkgname=quick-switcher-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Cross-platform window quick switcher (like Alfred/Raycast/Listary)"
arch=('x86_64')
url="https://github.com/acgq/quick-switch"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
provides=('quick-switcher')
conflicts=('quick-switcher')
source=("https://github.com/acgq/quick-switch/releases/download/v${pkgver}/Quick%20Switcher_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir"
}
