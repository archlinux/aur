# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmflame
pkgver=0.60
pkgrel=1
pkgdesc="A dock app that makes an animated flame"
arch=('i686' 'x86_64')
url="http://novalis.dorm.reed.edu/cgi.html"
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmflame-0.60.tar.gz")
md5sums=('a9de2b284d95cc9933ce9ba869a6fa67')

build() {
  cd "$srcdir/$pkgname.app/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname.app/$pkgname"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}


# vim: set sw=2 et:
