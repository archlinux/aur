# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-plasmalights
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Plasma LED driver, FX Sequencer and plugins for Pimoroni."
arch=('any')
url="https://github.com/pimoroni/plasma"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha512sums=('ad60d5a579948644f4d52ca705e2c028226eb8340ecbf24b523da8dc7c8012533d73bc3c279b4f7c00c88e0745f629b6bfd65cc436d6d2f3c808c71c8f5d1ab0')

package() {
  cd plasmalights-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
