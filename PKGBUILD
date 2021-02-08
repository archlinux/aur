# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=stripe
pkgname=python-stripe
pkgver=2.55.2
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/stripe-python"
license=('MIT')
depends=('python>=3.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e32c68194a47522a10945eb893218e5cb5ee65e3a3c2c4df7efca117a6bf1902')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
