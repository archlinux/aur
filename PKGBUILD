# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=python-kismetdb
pkgver=2019.5.5
pkgrel=1
pkgdesc="A python wrapper for the Kismet database"
arch=("any")
url="https://pypi.org/project/kismetdb/"
license=('GPL')
depends=(python python-simplekml)
source=("https://files.pythonhosted.org/packages/65/46/f8e4c81912fde7cc7fa411233cfdd86822e8d95f34b14a970e774bfd0bb8/kismetdb-${pkgver}.tar.gz")
md5sums=('6fd3938d84a633f16970880a82a4b6f5')

package() {
	cd "kismetdb-$pkgver"
	python setup.py install --root=${pkgdir}
}
