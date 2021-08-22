# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
pkgname=python-kismetdb
pkgver=2021.6.1
pkgrel=1
pkgdesc="A python wrapper for the Kismet database"
arch=("any")
url="https://pypi.org/project/kismetdb/"
license=('GPL')
depends=(python python-simplekml)
source=("https://files.pythonhosted.org/packages/00/fa/29ac46ef3f342f3624cabe99e42b0350d0f1ea824e2c90fe15958f77d862/kismetdb-2021.6.1.tar.gz")
sha256sums=('a8d8cc54fdde8888f27ce87cf122440907f960b78346443c7710260b89c4436b')

package() {
	cd "kismetdb-$pkgver"
	python setup.py install --root=${pkgdir}
}
