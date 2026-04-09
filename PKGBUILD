# Maintainer: Jedrzej Ratajczak <mrozelek@gmail.com>
pkgname=nilwall-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK4 wallpaper manager for Hyprland"
arch=('x86_64')
url="https://github.com/jedrzejratajczak/nil"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
provides=('nilwall')
conflicts=('nilwall')
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://github.com/jedrzejratajczak/nil/releases/download/v${pkgver}/nil-v${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "nilwall" "${pkgdir}/usr/bin/nilwall"
}
