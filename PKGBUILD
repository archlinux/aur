# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=libindi-atik-bin
pkgver=1.28
pkgrel=1
pkgdesc="INDI drivers for Atik CCDs"
arch=("i686" "x86_64" "arm" "armv6h" "armv7h")
url="http://indilib.org/devices/ccds/atik-ccd.html"
license=('unknown')
depends=('libindi' 'libnova14-compat')

source_i686=("http://download.cloudmakers.eu/atikccd-${pkgver}-i386.deb")
source_x86_64=("http://download.cloudmakers.eu/atikccd-${pkgver}-amd64.deb")
source_arm=("http://download.cloudmakers.eu/atikccd-${pkgver}-armhf.deb")
source_armv6h=("http://download.cloudmakers.eu/atikccd-${pkgver}-armhf.deb")
source_armv7h=("http://download.cloudmakers.eu/atikccd-${pkgver}-armhf.deb")

sha256sums_i686=('26c225c56737f9575f8466d99b67005e4125cb8697112440deabaaad69d854de')
sha256sums_x86_64=('57a46d7a8ccdf74b52553dc6b2e3d4fc1b6c179aaa0743f2565b25e1cfa55aee')
sha256sums_arm=('f1e4c57e6c60c5129817e4e82501cb04cbf4bdbd1236d60a5fbeb314f003ea45')
sha256sums_armv6h=('f1e4c57e6c60c5129817e4e82501cb04cbf4bdbd1236d60a5fbeb314f003ea45')
sha256sums_armv7h=('f1e4c57e6c60c5129817e4e82501cb04cbf4bdbd1236d60a5fbeb314f003ea45')

package() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  mv "${pkgdir}/lib/"* "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/lib"
}
