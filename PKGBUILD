# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='python-uflash'
pkgver=1.2.1
pkgrel=0
pkgdesc="A module and utility to flash Python onto the BBC micro:bit"
url="https://pypi.python.org/pypi/uflash/"
arch=('any')
license=('GPL')
depends=('python' 'python-click')
makedepends=('python-setuptools')
provides=('python-uflash' 'uflash')
source=("https://files.pythonhosted.org/packages/e9/f1/a41607db0313696581d1bb8af8c3137b2e3806c06cf0c9c5ff2f170a0abb/uflash-${pkgver}.tar.gz")
sha256sums=('4aa3c7e2d91316e7ad7c1228767f59cf23bdd8180acc3147fbc693dfea349b03')

package() {
  cd "${srcdir}/uflash-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

