# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: bjo@nord-west.org

pkgname=mopidy-podcast
_pypiname=Mopidy-Podcast
pkgver=2.0.0
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
source=("https://github.com/tkem/mopidy-podcast/archive/v${pkgver}.tar.gz")
md5sums=('a172d038e8240f2ca0155624fd4a11be')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
