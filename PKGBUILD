# Maintainer: neodarz <neodarz at neodarz dot net>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-8161210"

pkgver=0.5.4
pkgrel=1
pkgdesc="Python API for YouTube"

url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')

provides=('python2-pafy')
depends=('python2' 'python2-youtube-dl')
conflicts=('python-pafy')

source=("python-pafy-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/archive/v$pkgver.tar.gz")
sha1sums=('bb79fce739f44e6ac0f13911c8e388378fd5fccf')

package() {
	cd pafy-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
}
