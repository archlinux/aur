# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='python-uflash'
pkgver=1.3.0
pkgrel=0
pkgdesc="A module and utility to flash Python onto the BBC micro:bit"
url="https://pypi.python.org/pypi/uflash/"
arch=('any')
license=('GPL')
depends=('python' 'python-click')
makedepends=('python-setuptools')
provides=('python-uflash' 'uflash')
source=("https://files.pythonhosted.org/packages/8d/5b/a163ee4154a95d6db4d52b01b6209be99443ead6301923e0243ffaad3ce0/uflash-1.3.0.tar.gz")
sha256sums=('f5cd58cb84394572100715a7829f8b1278d950d793913662c5aef6849f39484e')

package() {
  cd "${srcdir}/uflash-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
