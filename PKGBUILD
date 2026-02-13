# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=tapps2
pkgver=1.24
_pkgname=tapps2-$pkgver
pkgrel=1
pkgdesc="A vector-based drawing program which was developed for planning and programming of
the UVR1611 and UVR16x2 controllers, the RSM610 control module, CAN-I/O45 and CAN-EZ2."
arch=("x86_64" "i386")
url="https://www.ta.co.at"
license=('Unknown')
makedepends=(rpm-tools cpio)
options=('!strip')
install="tapps2.install"
source_x86_64=("$_pkgname-x86_64.rpm::$url/fileadmin/Downloads/Software/TAPPS2/Linux/64bit/$_pkgname-x86_64.rpm")
sha256sums_x86_64=('f23afabcbda83321e05cade0a4a204559a23d79704ae09c180792b2b6d76351d')
source_i386=("$_pkgname-i386.rpm::$url/fileadmin/Downloads/Software/TAPPS2/Linux/32bit/$_pkgname-i386.rpm")
sha256sums_i386=('38b85f096e30c80615731e155f6e33b36006a3d5beeeda5cf97749adca41657b')

package() {
  rpm2cpio tapps2-$pkgver-$CARCH.rpm | cpio -idmv -D $pkgdir/
}
