# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>

pkgname='adafruit-ampy'
pkgver=1.0.5
pkgrel=1
pkgdesc="ESP8266 FS management tool provided by Adafruit"
url="https://github.com/adafruit/ampy"
arch=('any')
license=('GPL')
depends=('python' 'python-click' 'python-pyserial')
makedepends=('python-setuptools')
provides=('python-ampy' 'ampy')
source=(https://github.com/adafruit/ampy/archive/${pkgver}.tar.gz)
#source=(https://pypi.python.org/packages/0e/59/de850f77f9a5b3f0c8a7b5ee671184a780fedc80a2aae1ee49a52d76214f/adafruit-ampy-0.6.2.tar.gz)
#sha512sums=('e57e3471e21ae0eb09f8e43ccba082775abba47a48283c4b9d3c9a54595b2d74ce547f158f898e38647d457fdbddcf8c446a0b85febdc2d87704d23ab0e2a653')

package() {
  cd "${srcdir}/ampy-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
md5sums=('75b0f2afe496b518e6ed2ac99a8b1bd1')
