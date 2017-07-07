pkgname=bandcamp-dl
pkgver=1.1
pkgrel=2
pkgdesc="cli application for downloading albums from bandcamp"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/bandcamp-downloader"
depends=('python' 'python-setuptools' 'python-requests' 'python-parsel' 'python-click')
makedepends=('git')
source=("git+https://github.com/Granitosaurus/bandcamp-downloader.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
  cd "${srcdir}/bandcamp-downloader"
  python setup.py install --root=${pkgdir}
}
