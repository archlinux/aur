# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-rebecca
pkgver=1.5
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 17.1 Rebecca"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('91279f51c2bb6134429b9a88a84a4a0bf7857b9ad3963ac1c0c9ed7d1e0e2193')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-rebecca
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}-${pkgver}/backgrounds/linuxmint-rebecca ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-${pkgver}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
