# Contributor: Mathieu Boespflug <mboes@tweag.net>
# Contributor: John Wallaby <drunken.wallaby@gmail.com>
# Maintainer: dumblob <dumblob@gmail.com>
pkgname=sinac
pkgver=0.1.2
pkgrel=5
pkgdesc="A cleaner/simpler alternative to xautolock for screen locking."
url="http://www.suckless.org/pipermail/dwm/2007-December/004691.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=(libxss)
makedepends=(libxss)
source=(sinac.c)
md5sums=('29d3cce1de6886f69f0b8ee33f041e17')
package() {
  cd $srcdir
  gcc sinac.c -lX11 -lXss -lXext -o sinac
  install -d $pkgdir/usr/bin/
  install sinac $pkgdir/usr/bin/
}
