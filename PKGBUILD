# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=stripe
pkgname=python-stripe
pkgver=1.28.0
pkgrel=1
pkgdesc='Stripe python bindings'
arch=('any')
url="https://github.com/stripe/stripe-python"
license=('MIT')
depends=('python>=3.0')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('3a655a9fed56611adb288171cf9996d8')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
