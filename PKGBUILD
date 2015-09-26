# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=0.17.3
pkgrel=1
pkgdesc='http client/server for asyncio'
arch=('any')
url="http://pypi.python.org/pypi/$_name"
license=('Apache')
depends=('python>=3.4' 'python-chardet')
makedepends=('python-setuptools')
makedepends_i686=('cython')
makedepends_x86_64=('cython')
source=("https://pypi.python.org/packages/source/a/$_name/$_name-$pkgver.tar.gz")
md5sums=('c3f97b127ef1fb58ea68fe79653d09f8')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}