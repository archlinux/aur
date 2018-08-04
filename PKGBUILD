# Maintaine Victor Roest <victor@xirion.net>

pkgname=xcursor-breeze-neutral-git
pkgver=7916345
pkgrel=1
pkgdesc="Neutral fork of KDEs Breeze Cursor"
url="https://github.com/TheScrawl/xcursor-breeze-neutral"
makedepends=('git')
depends=('libxcursor')
provides=('xcursor-breeze-neutral')
source=(git+https://github.com/TheScrawl/xcursor-breeze-neutral)
sha256sums=('SKIP')
arch=(any)

pkgver() {
    cd ${srcdir}/xcursor-breeze-neutral
    git rev-parse --short HEAD
}

package() {
    install -dm755 "$pkgdir"/usr/share/icons/
    cp -r ${srcdir}/xcursor-breeze-neutral $pkgdir/usr/share/icons/
}
