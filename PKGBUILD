# Maintainer: Jedrzej Ratajczak <mrozelek@gmail.com>
pkgname=nilpower-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="GTK4 power menu overlay for Hyprland"
arch=('x86_64')
url="https://github.com/jedrzejratajczak/nil"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('nilpower')
conflicts=('nilpower')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/jedrzejratajczak/nil/releases/download/v${pkgver}/nil-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "nilpower" "${pkgdir}/usr/bin/nilpower"
}
