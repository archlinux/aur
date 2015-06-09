# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mailer
pkgver=0.7
pkgrel=3
pkgdesc="A module that simplifies sending email."
arch=('any')
url='http://pypi.python.org/pypi/mailer'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/m/mailer/mailer-$pkgver.zip")
options=(!emptydirs)

package() {
	cd "$srcdir/mailer-$pkgver"
	2to3 -nw .
	python setup.py install --root="$pkgdir" -O1
}

sha256sums=('294097bdd3698d1268b3bc07d90b3b47b56cce47c61a394322ac68f9fee0f8f3')
