# Maintainer: slothgrind <slothgrind@proton.me>

pkgname='pass-xkcd'
pkgver=0.0.1
pkgrel=1
pkgdesc='A pass extension for generating xkcd-style passphrases.'
arch=('any')
url='https://gitlab.com/slothgrind/pass-xkcd'
license=('GPL3')
depends=('pass')
source=("https://gitlab.com/slothgrind/pass-xkcd/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('ebfd2f85ae2b62cfcebd0e17e735558c09a249cf63344e6acfdbdbe38b38f6a9')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install
}
