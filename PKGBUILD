# Maintainer: bjo@nord-west.org

pkgname=mopidy-podcast
_pypiname=Mopidy-Podcast
pkgver=1.1.1
pkgrel=2
pkgdesc="Mopidy extension for searching and browsing podcasts."
arch=('any')
url="https://github.com/tkem/mopidy-podcast"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-setuptools'
	'python2-pykka'
	'python2-cachetools'
	'python2-uritools'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('48d3e685d5fc0a0fe0bdd12ef432cd39')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
