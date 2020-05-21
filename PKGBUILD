# Maintainer: neodarz <neodarz at neodarz dot net>
# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=python2-pafy
_pkgname="mps-youtube-pafy-8161210"

pkgver=0.5.5
pkgrel=1
pkgdesc="Python API for YouTube"

url='https://github.com/mps-youtube/pafy'
arch=('any')
license=('GPL3')

provides=('python2-pafy')
depends=('python2' 'python2-youtube-dl')
makedepends=('git' 'python2-setuptools')
conflicts=('python-pafy' 'python2-pafy-git')

source=("python-pafy-$pkgver.tar.gz::https://github.com/mps-youtube/pafy/archive/v$pkgver.tar.gz")
sha512sums=('93a69b72bca33567499d5a10c0cebfb02db1df461c128f6a3a53eed5f84ae4364d6bbe432f2a337b82c86302e942d4e194922663702e61b003e3d574300c7383')

package() {
	cd pafy-$pkgver
	python2 setup.py install --root="$pkgdir" --optimize=1
}
