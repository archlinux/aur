# Maintainer: Philipp A. <flying-sheep@web.de>
_pypiname=pyRserve
pkgname=python-rserve
pkgver=0.9.2
pkgrel=1
pkgdesc='Python client to remotely access the R statistic package via network'
arch=(any)
url="https://$_pypiname.readthedocs.io/"
license=(MIT)
depends=(python-numpy)
source=("https://files.pythonhosted.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('d8d8563a265ad5b83362bc3e001fb9d6a5133190f8c9884914d7c91ff99d7310')

package() {
	cd "$srcdir/$_pypiname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
