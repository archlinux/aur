# Maintainer: # Alexey Korop akorop@ukr.net
pkgname=s1kls
pkgver=1.03
pkgrel=1
pkgdesc='Simple X11 1-key Keyboard layout switcher'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/s1kls'
license=('GPL')
depends=('libx11')
source=(http://sourceforge.net/projects/s1kls/files/s1kls-1.03.tgz)
install=${pkgname}.install
md5sums=('040558e8ff4007bc9ffee4d34fe87e3d')
build () {
  cd $srcdir
  gcc -lX11 -pthread s1kls.c -o s1kls
}

package () {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
