# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='python-uflash'
pkgver=1.2.3
pkgrel=0
pkgdesc="A module and utility to flash Python onto the BBC micro:bit"
url="https://pypi.python.org/pypi/uflash/"
arch=('any')
license=('GPL')
depends=('python' 'python-click')
makedepends=('python-setuptools')
provides=('python-uflash' 'uflash')
source=("https://files.pythonhosted.org/packages/c6/8a/5c007e1403a77385f157bae23e7a42b5a26260321f8ee22a275b23cce7f8/uflash-1.2.3.tar.gz")
sha256sums=('e8aa905d233711a216955024af926ad629c3d68284f4086f825a3494ed471a9f')

package() {
  cd "${srcdir}/uflash-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
