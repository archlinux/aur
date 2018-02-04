# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: bjo@nord-west.org

pkgname=mopidy-podcast
_pypiname=Mopidy-Podcast
pkgver=2.0.2
pkgrel=1
pkgdesc="Mopidy extension for searching and browsing podcasts."
arch=('any')
url="https://github.com/tkem/mopidy-podcast"
license=('APACHE')
depends=('mopidy>=1.0'
         'python2-setuptools'
         'python2-pykka'
         'python2-cachetools'
         'python2-uritools')
makedepends=('python2' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tkem/mopidy-podcast/archive/v${pkgver}.tar.gz")
sha256sums=('19a30d4e5523a38b9aab293247c6b1355c3c83a9a8c12a3608e6147896d64198')

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
