# Contributor: Henrik Nymann Jensen <h@henriknj.dk>

pkgname=revoco2
pkgver=1.0
pkgrel=1
pkgdesc="Change the wheel behaviour of Logitech's MX-Revolution mouse."
arch=('i686' 'x86_64')
url="https://github.com/tech2077/revoco2"
license=()
source=('git+https://github.com/tech2077/revoco2.git')
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  make || return 1
}

package() {
  cd $srcdir/$pkgname
  install -D -m755 revoco $pkgdir/usr/bin/revoco
}
