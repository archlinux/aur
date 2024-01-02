pkgname=chicken-srfi-1
_name=srfi-1
pkgver=0.5.1
pkgrel=1
pkgdesc='Chicken Scheme SRFI-1 list library'
arch=('x86_64')
license=('BSD')
depends=('chicken')
makedepends=()
url='http://wiki.call-cc.org/eggref/5/srfi-1'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  cp -a ${srcdir}/* -t ${pkgdir}/usr/lib/chicken/11
}

