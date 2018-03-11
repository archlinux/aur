# Maintainer: robertfoster

_pkgsrcname=PyRIC
pkgname=python2-pyric
pkgver=0.1.6.3
pkgrel=1
pkgdesc="Linux wireless library for the Python Wireless Developer and Pentester"
url="http://wraith-wireless.github.io/PyRIC/"
license=("MIT")
arch=("any")
depends=('python2' 'python2-twisted')
source=("https://pypi.python.org/packages/08/64/a99f27d3b4347486c7bfc0aa516016c46dc4c0f380ffccbd742a61af1eda/PyRIC-$pkgver.tar.gz")

package() {
	cd $srcdir/${_pkgsrcname}-$pkgver
	python2 setup.py install --root $pkgdir
	rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests/
}
md5sums=('c711069b2c1cb4fcc16312fed9b4d287')
