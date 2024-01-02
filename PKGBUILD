pkgname=chicken-srfi-13
_name=srfi-13
pkgver=0.3.4
pkgrel=2
pkgdesc='Chicken Scheme SRFI-13 string library'
arch=('x86_64')
license=('BSD')
depends=('chicken' 'chicken-srfi-14')
url='http://wiki.call-cc.org/eggref/5/srfi-13'

build() {
  CHICKEN_INSTALL_REPOSITORY=${srcdir} CHICKEN_INSTALL_PREFIX=${srcdir} chicken-install -no-install-dependencies $_name:$pkgver
}
package() {
  install -d ${pkgdir}/usr/lib/chicken/11
  cp -a ${srcdir}/* -t ${pkgdir}/usr/lib/chicken/11
}

