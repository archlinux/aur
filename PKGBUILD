# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp_retry
pkgname=python-aiohttp-retry
pkgver=2.4.5
pkgrel=1
pkgdesc="Simple aiohttp retry client"
arch=('any')
url="https://github.com/inyutin/aiohttp_retry"
license=('Apache')
depends=('python>=3.5' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inyutin/aiohttp_retry/archive/v${pkgver}.tar.gz")
md5sums=('2a99115b8728170d084376f80d326367')

package() {
	cd "$srcdir/$_name-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
