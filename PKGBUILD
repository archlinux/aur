# Maintainer: bjo@nord-west.org

pkgname=mopidy-podcast-itunes
_pypiname=Mopidy-Podcast-iTunes
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy-Podcast extension for searching and browsing podcasts on the iTunes Store"
arch=('any')
url="https://github.com/tkem/mopidy-podcast-itunes"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'mopidy-podcast'
	'python2-requests'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('c405fffd9ada8115a8b5ae35865105d8')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
