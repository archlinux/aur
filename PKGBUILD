# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=0.19.0
pkgrel=2
pkgdesc='http client/server for asyncio'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('Apache')
depends=('python>=3.4.1' 'python-chardet')
optdepends=('python-cchardet: faster character encoding detector')
makedepends=('cython' 'python-setuptools')
source=("https://pypi.python.org/packages/source/a/$_name/$_name-$pkgver.tar.gz")
md5sums=('f1c56892fc8b1b4f781470c7dd4226eb')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
