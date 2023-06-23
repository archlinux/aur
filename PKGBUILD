# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-victoria
pkgver=1.2
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 21.2 victoria"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('a8de3ae8baae5f58d037f2f329d5ece087397ef1e2d2835245ec570304a367d5')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-victoria
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}/backgrounds/linuxmint-victoria ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
