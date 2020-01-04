# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-olivia
pkgver=1.7
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 15 Olivia"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('223cdb3fb85c5ff8a137529d4011a7a934fe07f79a77e2eeaf37b2a12f13f187')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-olivia
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}-${pkgver}/backgrounds/linuxmint-olivia ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-${pkgver}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
