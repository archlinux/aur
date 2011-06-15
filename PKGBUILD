# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-mailer
pkgver=0.7
pkgrel=1
pkgdesc="A module that simplifies sending email."
arch=('any')
url='http://pypi.python.org/pypi/mailer'
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/m/mailer/mailer-$pkgver.zip")
options=(!emptydirs)

build() {
	cd "$srcdir/mailer-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('13f4ae9de5ea7ac49927b028d87f105e')
sha1sums=('5e11d6bddd2b74599dcb604e2ecc1d2dc620d82b')
