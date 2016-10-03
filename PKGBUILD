# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='python-uflash'
pkgver=1.0.3
pkgrel=0
pkgdesc="A module and utility to flash Python onto the BBC micro:bit"
url="https://pypi.python.org/pypi/uflash/"
arch=('any')
license=('GPL')
depends=('python' 'python-click')
makedepends=('python-setuptools')
provides=('python-uflash','uflash')
source=("${pkgname}::https://pypi.python.org/packages/74/1a/1aee5ea2d551b477f95f39def41a21b12ca4c26c2ee513c1a27d5f46fe70/uflash-${pkgver}.tar.gz")
sha512sums=('SKIP')

package() {
  cd "${srcdir}/uflash-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

