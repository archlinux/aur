# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>

pkgname=zramen-dinit
pkgver=20250908
pkgrel=1
pkgdesc="dinit service scripts for zramen"
arch=('any')
url="https://artixlinux.org"
license=('GLWTPL')
depends=('zramen' 'dinit')
conflicts=('init-zramen' 'zramen-dinit')
provides=('init-zramen')
source=("zramen" "zramen.conf")
sha256sums=('b1c28559af2aa2000e50fa112d29402bc5cb822d3992d2abb0b97326eec42f00'
            '76f12a9ed0cabec4181582b9390da0bdc9da8d6510d4b81cd7c5161c97ced6c7')

package() {
    install -Dm644 zramen -t "$pkgdir/etc/dinit.d"
    install -Dm755 zramen.script "$pkgdir/etc/dinit.d/config/zramen.conf"
}
