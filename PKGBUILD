# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-55afb5d"
pkgver=v0.3.76
pkgrel=1
pkgdesc="Python API for YouTube"
url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')
provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/tarball/$pkgver")
md5sums=('165a1ef429ad3cc0cd53154c497a9289')

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
