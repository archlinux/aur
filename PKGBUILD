# Maintainer: Dylan Whichard <dylan@whichard.com>
_name=pyalexa
pkgname=python-pyalexa
pkgver=0.1.1
pkgrel=1
pkgdesc='Simple Python API for creating Amazon Echo skills'
arch=('any')
url="https://github.com/umbc-hackafe/$_name"
license=('MIT')
depends=('python>=3.0')
makedepends=('python-setuptools')
optdepends=('python-flask: to provide a built-in HTTP API')
source=("https://pypi.python.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('a67e7d55a9633a1663b935e1ea575414')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
