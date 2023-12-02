# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-helena
pkgver=1.0
pkgrel=5
pkgdesc="The backgrounds included in Linux Mint 8 Helena"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('dea2b270d1c13cebdb348b42e39baece112549609cd7651f5bd2438b4275b13a')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-helena
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-helena ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
