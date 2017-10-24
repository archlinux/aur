# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=bandcamp-dl
pkgver=1.13
pkgrel=1
pkgdesc="cli application for downloading albums from bandcamp"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/bandcamp-downloader"
depends=('python' 'python-setuptools' 'python-requests' 'python-parsel' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/bandcamp-downloader/archive/v${pkgver}.tar.gz")
md5sums=('41e809347cb010b7962d4b5c075d8666')
package() {
  cd "${srcdir}/bandcamp-downloader-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
