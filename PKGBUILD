# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-num2words'
pkgver=0.5.11
pkgrel=1
pkgdesc="Python modules to convert numbers to words."
arch=('any')
url='https://github.com/savoirfairelinux/num2words'
license=('LGPL')
makedepends=('python-setuptools')
checkdepends=('python')
source=("https://github.com/savoirfairelinux/num2words/archive/v${pkgver}.tar.gz")
sha256sums=('0d2ef40ce732428a48b1012d6b342edef6d9a71cce12dcaab9347bd305392beb')

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
