# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-isadora
pkgver=1.0
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 9 Isadora"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('5b2f1dafa77cdc40d012eea3a0f51f02f2de80aa604246cc73386c53a9aa3168')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-isadora
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-isadora ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
