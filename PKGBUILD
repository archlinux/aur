# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-jdtranslationhelper
pkgver=2.1
pkgrel=1
pkgdesc='A simple API for translating your programs'
arch=('any')
url="https://gitlab.com/JakobDev/jdTranslationHelper"
license=('BSD')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/jdTranslationHelper/-/archive/${pkgver}/jdTranslationHelper-${pkgver}.tar.gz")
sha256sums=('86be8fb6ca81505cc1e9fd393cab853867923b2ed01e1a06fa630ab877557d87')

package() {
  cd "jdTranslationHelper-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}