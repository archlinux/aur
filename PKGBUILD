# Maintainer: Jelle van der Waa <jelle@archlinux.org>
_name=molotov
pkgname=python-molotov
pkgver=1.6
pkgrel=1
pkgdesc="Load Testing Tool"
arch=('any')
url="https://github.com/loads/molotov"
license=('APL')
makedepends=('python-setuptools')
depends=('python' 'python-aiohttp')
source=("$_name-$pkgver.tar.gz::https://github.com/loads/molotov/archive/1.6.tar.gz")
md5sums=('302e24fda5c61a0c525951fc5f19ff8b')

package() {
	cd "$_name-$pkgver"
        python3 setup.py install --root="$pkgdir" --optimize=1
}
