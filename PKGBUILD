# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: bjo@nord-west.org

pkgname=mopidy-podcast
pkgver=3.0.1
pkgrel=1
pkgdesc="Mopidy extension for searching and browsing podcasts."
arch=('any')
url="https://github.com/tkem/mopidy-podcast"
license=('APACHE')
depends=('mopidy>=3.0' python-setuptools python-pykka python-cachetools python-uritools)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tkem/mopidy-podcast/archive/v${pkgver}.tar.gz")
sha256sums=('ba230e10ec3e771effa375928dcd68b67b88119105ad22d0d2f3c4ce07332d27')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

