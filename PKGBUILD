# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname=libindi-atik-bin
pkgver=1.26
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

sha256sums_i686=('68ccff739d7dfdb74b55b9bd0e0f22ae0ff47dc013a3ed23e421276f56d3a848')
sha256sums_x86_64=('42ba7e1e9c600380478366b0a3543a53643c9e059ac1b8db985c2a8bd918f874')
sha256sums_arm=('b18370612e60db119626b8338207eadda78311d942631ecc2c15ddfcc465834d')
sha256sums_armv6h=('b18370612e60db119626b8338207eadda78311d942631ecc2c15ddfcc465834d')
sha256sums_armv7h=('b18370612e60db119626b8338207eadda78311d942631ecc2c15ddfcc465834d')

package() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  mv "${pkgdir}/lib/"* "${pkgdir}/usr/lib/"
  rmdir "${pkgdir}/lib"
}
