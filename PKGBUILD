# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-userspacefs
_pkgname=userspacefs
pkgver=1.0.13
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('6e809fd77c5cc8d5c24b9567ab1ce63f')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
