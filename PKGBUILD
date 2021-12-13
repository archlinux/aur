# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=python-plasmalights
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=2
pkgdesc="Plasma LED driver, FX Sequencer and plugins for Pimoroni."
arch=('any')
url="https://github.com/pimoroni/plasma"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha512sums=('fcdedbf6dfaee6e8d6061a8270d221133b41315f9d1adf411ca2e512e7b1d48f70d437744658952c6af4b4726462f2c7ebfaa637c94ba14d54435a5731391cd6')

package() {
  cd plasmalights-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
