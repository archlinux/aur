# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-virginia
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 21.3 virginia"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('7aad260184afd9512cca67071c0bba2bf8d4645824299bd1118cefc51e1fb8c8')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-virginia
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}/backgrounds/linuxmint-virginia ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
