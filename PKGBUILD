# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-uma
pkgver=1.2
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 20.2 Uma"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('adccbda9ab4eb661b7797464ba3a57c2eeed18d62b50c12e0d3cd85687ee0b45')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-uma
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}/backgrounds/linuxmint-uma ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
