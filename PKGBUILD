pkgname=bandcamp-dl
pkgver=1.11
pkgrel=4
pkgdesc="cli application for downloading albums from bandcamp"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/bandcamp-downloader"
depends=('python' 'python-setuptools' 'python-requests' 'python-parsel' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/bandcamp-downloader/archive/v${pkgver}.tar.gz")
md5sums=('bafdee3dac0b61870ab7ff085e7b762d')
package() {
  cd "${srcdir}/bandcamp-downloader-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
