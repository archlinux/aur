# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=tapps2
pkgver=1.19.1
_pkgname=tapps2-$pkgver-$CARCH-rpm
pkgrel=1
pkgdesc="A vector-based drawing program which was developed for planning and programming of
the UVR1611 and UVR16x2 controllers, the RSM610 control module, CAN-I/O45 and CAN-EZ2."
arch=("x86_64" "i386")
url="https://www.ta.co.at"
license=('Unknown')
makedepends=(rpm-tools cpio)
options=('!strip')
install="tapps2.install"
source=("$_pkgname.zip::$url/fileadmin/Downloads/Software/TAPPS2/Linux/64bit/$_pkgname.zip")
sha256sums=('SKIP')

package() {
  rpm2cpio tapps2-$pkgver-$CARCH.rpm | cpio -idmv -D $pkgdir/
}
