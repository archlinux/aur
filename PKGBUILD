# Maintainer: DaarkWel <daarkwel[at]gmail[dot]com>
_prog=xroot
pkgname=${_prog}-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="GUI frontend for su/sudo"
url="https://code.google.com/p/xroot/"
arch=('x86_64' 'i686')
[ "$CARCH" = "i686"   ] && B=32bit
[ "$CARCH" = "x86_64" ] && B=64bit
license=('GPL2')
depends=('libx11')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://xroot.googlecode.com/files/${_prog}-${pkgver}.tar.gz")
md5sums=('4a7d43bb9b755a422e2ee77df422b62b')


package() {
  mkdir -p $pkgdir/usr/bin
  install -D -m755 $srcdir/${_prog}-${pkgver}/$B/* $pkgdir/usr/bin/
}
