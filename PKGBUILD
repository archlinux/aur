pkgname=chicken-srfi-14
_name=srfi-14
pkgver=0.2.1
pkgrel=1
pkgdesc='Chicken Scheme SRFI-14 character-sets library'
arch=('x86_64')
license=('BSD')
depends=('chicken')
makedepends=()
url='http://wiki.call-cc.org/eggref/5/srfi-14'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  cp -a ${srcdir}/* -t ${pkgdir}/usr/lib/chicken/11
}

