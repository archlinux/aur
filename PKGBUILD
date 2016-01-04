# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-8161210"

pkgver=v0.3.82
pkgrel=1
pkgdesc="Python API for YouTube"

url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')

provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/tarball/$pkgver")
md5sums=('fa50619ebd370abdd808be7a1d0e0fd0')
sha1sums=('dfe7d7c535957c5267ed73a6699cad5891a5b16a')

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
