pkgname=bandcamp-dl
pkgver=1.11
pkgrel=3
pkgdesc="cli application for downloading albums from bandcamp"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/bandcamp-downloader"
depends=('python' 'python-setuptools' 'python-requests' 'python-parsel' 'python-click')
makedepends=('git')
source=("https://github.com/Granitosaurus/bandcamp-downloader/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
  cd "${srcdir}/bandcamp-downloader"
  python setup.py install --root=${pkgdir}
}
