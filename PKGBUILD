# Maintainer: cippaciong <lacapannadelloziotom [at] gmail [dot] com>

pkgname=xcursor-pulse-glass
_pkgname=Pulse-Glass
pkgver=1.0
pkgrel=4
pkgdesc="Pulse Glass cursor theme"
arch=('any')
url="http://xfce-look.org/content/show.php/Pulse+Glass?content=124442"
license=('GPL')
depends=()
source=("https://dl.opendesktop.org/api/files/download/id/1460735439/124442-Pulse-Glass.tar.gz")
sha256sums=('f6033e0e1112015584662f89f18012f0bbd901fec8ecc3d612defaeedd40e4c0')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/icons"
}


# vim:set ts=2 sw=2 et:
