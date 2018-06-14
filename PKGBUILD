# Maintainer: Donald Webster <fryfrog@gmail.com>
pkgname=python2-logutils
pkgver=0.3.5
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/logutils"
license=(LGPL)
depends=(python2)
makedepends=(python2-distribute)
conflicts=(${pkgname}-git)
source=("https://pypi.python.org/packages/source/l/logutils/logutils-${pkgver}.tar.gz")
sha512sums=('0194bf4f01e7a29d4211495dc5fead9d4bd5bc1b791d25ff38ad28960a229a9bcdbaa7e6d3b5a4105eef6c9aa159459d6529c2615df113e7ec1ae93aac5cce6c')

package() {
  cd "${srcdir}/logutils-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
