# Maintainer: Phil Schaf <flying-sheep@web.de>

_pkgname=rst2pdf
pkgname=python-rst2pdf
pkgver=0.93
pkgrel=3
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/$_pkgname/$_pkgname"
license=('MIT')
conflicts=(python2-rst2pdf)
depends=('python-setuptools' 'python-docutils' 'python-reportlab>=2.4' 'python-pygments' 'python-pdfrw')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('91ee1eb4d22162366262c0aa00447525')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	2to3 -w .
	python setup.py install --root="$pkgdir/" --optimize=1
}
