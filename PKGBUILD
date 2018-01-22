# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mailer
pkgver=0.8.1
pkgrel=1
pkgdesc="A module that simplifies sending email."
arch=('any')
url='http://pypi.python.org/pypi/mailer'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/m/mailer/mailer-$pkgver.zip")
sha256sums=('3411a12197731e0d5379ab194d9acc8d0d71c8b95fdfb11474d67c3e9860070e')
options=(!emptydirs)

package() {
	cd "$srcdir/mailer-$pkgver"
	python setup.py install --root="$pkgdir" -O1
}
