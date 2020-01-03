# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-rafaela
pkgver=1.2
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 17.2 Rafaela"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('a3880fe98797d1eefcd3f9504aca0804ad071df7c1d410566ead663213b6391c')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-rafaela
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}-${pkgver}/backgrounds/linuxmint-rafaela ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-${pkgver}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}-${pkgver}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
