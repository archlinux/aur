# Autor:  Alexey Korop akorop@ukr.net

pkgname=s1kls
pkgver=1.02
pkgrel=1
pkgdesc='Simple X11 1-key Keyboard layout switcher'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/s1kls'
license=('GPL')
depends=('libx11')
source=(http://sourceforge.net/projects/s1kls/files/s1kls-1.02.tgz)
install=${pkgname}.install
md5sums=('c6da81b73a84ab600acbbc6c6263ca3c')
build () {
  cd $srcdir
  gcc -lX11 -pthread s1kls.c -o s1kls
}

package () {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}