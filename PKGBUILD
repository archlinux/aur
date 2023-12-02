# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-katya
pkgver=1.0.1
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 11 Katya"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('8b305f7b93bc2da06d34a70e5476c29400f55f96c61b9ad37953a64fbfbe0010')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-katya
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}-1.0/usr/share/backgrounds/linuxmint-katya ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-1.0/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-1.0/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
