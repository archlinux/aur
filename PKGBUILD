# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmfirew
pkgver=0.20
pkgrel=1
pkgdesc="A dock app that draws fireworks, which go up and explode"
arch=('i686' 'x86_64')
url="http://novalis.dorm.reed.edu/cgi.html"
license=('GPL')
depends=('libxpm')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmfirew-0.20.tar.gz")
md5sums=('0862f9513a71d60d9c6535780f37b5f1')

build() {
  cd "$srcdir/$pkgname.app/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname.app/$pkgname"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim: set sw=2 et:
