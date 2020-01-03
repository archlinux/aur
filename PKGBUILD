# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-maya
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 13 Maya"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('b2050f5023a28855290222a15a4023eb2ee8bb627961d7a8e55b6c73384adc2b')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-maya
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-maya ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
