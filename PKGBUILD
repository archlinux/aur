# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-iso-639
pkgname='python-iso-639'
_name=${pkgname#python-}
pkgver=0.4.5
pkgrel=1
pkgdesc='ISO 639 library.'
arch=('any')
url='https://pypi.org/project/iso-639/'
license=('AGPL-3.0')
depends=('python')
makedepends=(
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5b27cbcd39173f03d6d54e1ecddf879b630e985c549d6084dab29134d30bcd0052f902a2c8ca5a0db891c197deb1a00f1acda880cf728e7589f0471c42982f73')

package() {
  cd iso-639-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
