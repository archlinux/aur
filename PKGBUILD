# Maintainer: cippaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=xcursor-pulse-glass
_pkgname=Pulse-Glass
pkgver=1.0
pkgrel=3
pkgdesc="Pulse Glass cursor theme"
arch=('any')
url="http://xfce-look.org/content/show.php/Pulse+Glass?content=124442"
license=('GPL')
depends=()
source=("http://xfce-look.org/CONTENT/content-files/124442-Pulse-Glass.tar.gz")
md5sums=('9691f12afcbb3a41332f14b6cbdd7353')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"
}


# vim:set ts=2 sw=2 et:
