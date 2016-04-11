# Maintainer: Étienne Deparis <etienne@depar.is>
# Maintainer: karnath <karnathtorjian@gmail.com>

pkgname=xcursor-ycursor
pkgver=2
pkgrel=2
pkgdesc="BeOS inspired xcursor theme"
arch=('any')
license=('custom:unknown')
url="http://www.customize.org/"
source=("http://archive.customize.org/files/xcursors/ycursors2.tbz2")
sha256sums=('4868051235870432dc1a14d1d970085060c8653c3412ce32893d6be497134958')

package() {
    mkdir -p $pkgdir/usr/share/icons/ycursors/cursors
    cp -a $srcdir/ycursors/* $pkgdir/usr/share/icons/ycursors/cursors
}
