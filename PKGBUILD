# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-3105f9b"
pkgver=v0.3.74
pkgrel=1
pkgdesc="Python API for YouTube"
url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')
provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/tarball/$pkgver")
md5sums=('c8a88337d56ad87e6e88f2e853cd0121')

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
