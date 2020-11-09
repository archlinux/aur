# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=stripe
pkgname=python-stripe
pkgver=2.55.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/stripe-python"
license=('MIT')
depends=('python>=3.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2eebf023595e8aa9d65d8b46ccc3c716185bb9625d0e39d3956282fd7525848d')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
