pkgname=bandcamp-dl
pkgver=1.12
pkgrel=1
pkgdesc="cli application for downloading albums from bandcamp"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/bandcamp-downloader"
depends=('python' 'python-setuptools' 'python-requests' 'python-parsel' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/bandcamp-downloader/archive/v${pkgver}.tar.gz")
md5sums=('39d3e8f7a4e78d451eac7b264f9abfc7')
package() {
  cd "${srcdir}/bandcamp-downloader-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
