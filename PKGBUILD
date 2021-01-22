# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=stripe
pkgname=python-stripe
pkgver=2.55.1
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/stripe-python"
license=('MIT')
depends=('python>=3.4')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6b70e2cf87cfbe0cb891b725b690495bc3d34ab0d82545a5989ecd3b5fa83e2a')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
