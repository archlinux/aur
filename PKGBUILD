# Maintainer: Jedrzej Ratajczak <mrozelek@gmail.com>
pkgname=nilwidgets-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK4 system monitoring widgets for Hyprland"
arch=('x86_64')
url="https://github.com/jedrzejratajczak/nil"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('nilwidgets')
conflicts=('nilwidgets')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/jedrzejratajczak/nil/releases/download/v${pkgver}/nil-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "nilwidgets" "${pkgdir}/usr/bin/nilwidgets"
}
