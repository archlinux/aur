# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors-051
pkgver=0.5.1
pkgrel=1
pkgdesc="Implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('i686' 'x86_64')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.4.1' 'python-aiohttp-135')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v0.5.1.tar.gz")
md5sums=('94b6a8c8949e3c3a44a84c9b2f5e1812')
replaces=('python-aiohttp-cors')
conflicts=('python-aiohttp-cors')
provides=('python-aiohttp-cors')


package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
