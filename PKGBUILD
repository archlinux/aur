# Autor:  Alexey Korop akorop@ukr.net

pkgname=s1kls
pkgver=1.01
pkgrel=1
pkgdesc='Simple X11 1-key Keyboard layout switcher'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/s1kls'
license=('GPL')
depends=('libx11')
source=(http://sourceforge.net/projects/s1kls/files/s1kls-1.01.tgz)
install=${pkgname}.install
md5sums=('4e3bc4eb4bdf1406352eb64b191435e5')
build () {
  cd $srcdir
  gcc -lX11 -pthread s1kls.c -o s1kls
}

package () {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}