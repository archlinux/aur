# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=stripe
pkgname=python-stripe
pkgver=5.0.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/stripe-python"
license=('MIT')
depends=('python>=3.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bdc8c5ee8e6b53c4767bbe720752cedb8af91db46ad96e511edd0fb74964ac5d')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
