# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname='adafruit-ampy'
pkgver=1.0.7
pkgrel=1
pkgdesc="ESP8266 FS management tool provided by Adafruit"
url="https://github.com/adafruit/ampy"
arch=('any')
license=('GPL')
depends=('python' 'python-click' 'python-pyserial' 'python-dotenv')
makedepends=('python-setuptools')
provides=('python-ampy' 'ampy')
source=(https://files.pythonhosted.org/packages/01/04/1131550fb49a8c1ccf459892208569179acc48a3c1ae5b44236b9bb64464/adafruit-ampy-${pkgver}.tar.gz)
sha512sums=('097f67915636c5491be98572c42782e9e98a14c4e37a6041f199b310790383e48fb61cf3d98b2d2902f01e3bbdc1f345b8c70c17a2a0eb62894c3a05cf1aa67f')

package() {
  cd "${srcdir}/adafruit-ampy-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
