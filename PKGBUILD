# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-block_tracing
_pkgname=block_tracing
pkgver=1.0.0
pkgrel=1
pkgdesc="Protect process memory"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/block_tracing"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('d15435f44ba28625482bcbd0b3f59688')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
