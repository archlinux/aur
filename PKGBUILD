# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-userspacefs
_pkgname=userspacefs
pkgver=1.0.7
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('85095ea790ad7d70f89214289fd7823b')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
