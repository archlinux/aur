# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmeyes
pkgver=0
pkgrel=1
pkgdesc="A dock app providing swallowed XEyes"
arch=('i686' 'x86_64')
url="http://home.istar.ca/~jenora/wmeyes.html"
license=('GPL')
depends=('libxpm' 'libxmu')
makedepends=('imake')
source=("http://www.cs.mun.ca/~gstarkes/wmaker/dockapps/files/wmeyes.tgz")
md5sums=('611509fd1ced9fc90abaa6487ea307eb')

build() {
  cd "$srcdir"
  xmkmf
  make $pkgname
}

package() {
  cd "$srcdir"
  install -Dm0755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim: set sw=2 et:
