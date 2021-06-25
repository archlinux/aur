# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: jharch <julian dot hossbach at gmx dot de>
# Contributor: Joonas Kärkkäinen <group55 at eth1 dot fi>
pkgname=lexmark-network-scan
pkgver=3.7.0.0
_pkgver=02012021
pkgrel=1
pkgdesc="Lexmark Network and USB Scan Drivers"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('java-runtime' 'sane' 'systemd' 'xsane' 'xorg-xdpyinfo')
provides=('libsane-lexmark_nscan.so=1.0.16')
install="$pkgname.install"
source=("https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_${_pkgver}_x86_64.deb")
sha256sums=('1c22b14f21d315bf1e5a69a994ebd2495349a5ab96472a00468c5572f98b8d47')

package() {
	bsdtar -xvf data.tar.gz -C "$pkgdir"
}
