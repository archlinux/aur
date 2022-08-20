# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
pkgver=0.5.12
pkgrel=1
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
makedepends=('python-setuptools')
checkdepends=('python')
source=("https://github.com/savoirfairelinux/num2words/archive/v${pkgver}.tar.gz")
sha256sums=('1df054ab1166d8b124fc7b965f8852f998f09c6002dbb27089212ec5af18131a')

prepare() {
  cd "${srcdir}/num2words-${pkgver}"
}

check() {
  cd "${srcdir}/num2words-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/num2words-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
