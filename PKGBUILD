# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-update'
pkgver=2.0
pkgrel=1
pkgdesc='A pass extension that provides an easy flow for updating passwords.'
arch=('any')
url='https://github.com/roddhjav/pass-update'
license=('GPL3')
depends=('pass')
source=(https://github.com/roddhjav/pass-update/releases/download/v${pkgver}/pass-update-${pkgver}.tar.gz)
sha512sums=('b13b8ba50850882df9ea67b9b5ee1f8d1012fd19d92a210a69f49e03a13cee44c01a43069662eb1af2e02df65d7711a9e7238b224dd8c1612e099e6b78768559')

package() {
  cd "${srcdir}/pass-update-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
