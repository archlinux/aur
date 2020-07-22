# Maintainer: Philipp A. <flying-sheep@web.de>

_name=goatools
pkgname=python-$_name
pkgver=1.0.6
pkgrel=1
pkgdesc='Python scripts to find enrichment of GO terms'
arch=(any)
url="https://github.com/tanghaibao/$_name"
license=(BSD)
depends=(python python-pandas python-numpy python-scipy python-xlsxwriter python-statsmodels python-xlrd python-docopt python-pydot python-requests python-wget)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3deeee5d207e5a2053a874e4e37e1f76de227aed72ca6abb7df8b888607c5e52')

package() {
	cd "$srcdir/${_name//-/_}-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
