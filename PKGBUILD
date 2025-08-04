# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=tapps2
pkgver=1.23.1
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
sha256sums_x86_64=('537bb3348555d0a16613e4dd313c25dfa9ee7fd6704f3377af33a1e9efb6faa1')
source_i386=("$_pkgname-i386.rpm::$url/fileadmin/Downloads/Software/TAPPS2/Linux/32bit/$_pkgname-i386.rpm")
sha256sums_i386=('94fdcb01567986c1f5dad91e5b80525833530e9c761819a0b28c508919dad3e1')

package() {
  rpm2cpio tapps2-$pkgver-$CARCH.rpm | cpio -idmv -D $pkgdir/
}
