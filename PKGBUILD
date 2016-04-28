# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=0.21.5
pkgrel=1
pkgdesc='http client/server for asyncio'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('Apache')
depends=('python>=3.4.1' 'python-chardet')
optdepends=('python-cchardet: faster character encoding detector')
makedepends=('cython' 'python-setuptools')
source=("https://pypi.python.org/packages/source/a/$_name/$_name-$pkgver.tar.gz")
md5sums=('8e10aeb6fb49c819a7a88de1b9ef281b')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
