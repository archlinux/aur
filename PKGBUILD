# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: bjo@nord-west.org

pkgname=mopidy-podcast
pkgver=3.0.0
pkgrel=1
pkgdesc="Mopidy extension for searching and browsing podcasts."
arch=('any')
url="https://github.com/tkem/mopidy-podcast"
license=('APACHE')
depends=('mopidy>=3.0' python-setuptools python-pykka python-cachetools python-uritools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tkem/mopidy-podcast/archive/v${pkgver}.tar.gz")
sha256sums=('d923c61c6ecb1346e87844ae38425dc2dbadc0877205d91105df1e8652a2df5a')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

