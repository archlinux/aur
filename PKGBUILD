# Contributor: Mathieu Boespflug <mboes@tweag.net>
# Maintainer: John Wallaby <drunken.wallaby@gmail.com>
pkgname=sinac
pkgver=0.1.2
pkgrel=4
pkgdesc="A cleaner/simpler alternative to xautolock for screen locking."
url="http://www.suckless.org/pipermail/dwm/2007-December/004691.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=(libxss)
makedepends=(xproto scrnsaverproto)
source=(sinac.c)
md5sums=('d7d3642a880636015bd507edf2f04ca2')
package() {
  cd $srcdir
  gcc sinac.c -lX11 -lXss -lXext -o sinac
  install -d $pkgdir/usr/bin/
  install sinac $pkgdir/usr/bin/
}
