# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-c710a7b"
pkgver=v0.3.78
pkgrel=1
pkgdesc="Python API for YouTube"
url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')
provides=('python2-pafy')
depends=('python2')
conflicts=('python-pafy')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/tarball/$pkgver")
md5sums=('7e6fa4f4435def2621138be718894593')

package() {
	cd "$_pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
