# Maintainer: neodarz <neodarz at neodarz dot net>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-8161210"

pkgver=0.5.5
pkgrel=1
pkgdesc="Python API for YouTube"

url='http://np1.github.io/pafy'
arch=('any')
license=('GPL3')

provides=('python2-pafy')
depends=('python2' 'python2-youtube-dl')
makedepends=('git' 'python2-setuptools')
conflicts=('python-pafy' 'python2-pafy-git')

source=("python-pafy-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/archive/v$pkgver.tar.gz")
sha1sums=('e190a90949605353a9c4c415f41fd4599f4ce1db')

package() {
	cd pafy-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
}
