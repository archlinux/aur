# Maintainer: bjo@nord-west.org

pkgname=mopidy-podcast
_pypiname=Mopidy-Podcast
pkgver=1.1.2
pkgrel=1
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
md5sums=('699bcd8e4fc295295534998cfeb290dc')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
