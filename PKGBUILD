# Maintainer: bjo@nord-west.org

pkgname=mopidy-podcast-gpodder
_pypiname=Mopidy-Podcast-gpodder.net
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy-Podcast extension for searching and browsing podcasts on gpodder.net"
arch=('any')
url="https://github.com/tkem/mopidy-podcast-gpodder"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-setuptools'
	'python2-requests'
	'mopidy-podcast'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('bb8400a38ae5e035e04c9dd0d8bec1a8')


package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
