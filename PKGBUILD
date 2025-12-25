# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions-bin
_pkgname=photoqt-extensions
pkgver=5.0
pkgrel=1
pkgdesc="Extensions for PhotoQt image viewer"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-extensions' 'photoqt-extensions-debug')
provides=('photoqt-extensions-bin-debug')
depends=('exiv2' 'imagemagick')
source=(https://photoqt.org/downloads/bin/$_pkgname-$pkgver.tar.gz)
sha256sums=('dbe6e921742f23dd71bc92f3c7fa9a02f3173d614a1db9fb903bb15d36d8f8b9')
install="photoqt-extensions.install"

package() {

  cd $srcdir/$_pkgname-$pkgver

  find extensions/ -type f -exec install -Dm 755 "{}" "$pkgdir/usr/lib/PhotoQt/{}" \;

}
