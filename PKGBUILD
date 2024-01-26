# Contributor: mosh5382 <arch@moshermail.com>

_name=aiohttp_retry
pkgname=python-aiohttp-retry
pkgver=2.8.3
pkgrel=1
pkgdesc="Simple aiohttp retry client"
arch=('any')
url="https://github.com/inyutin/aiohttp_retry"
license=('Apache')
depends=('python>=3.5' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inyutin/aiohttp_retry/archive/v${pkgver}.tar.gz")
md5sums=('80f0687048306842dbf9c807124b26fd')


build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
