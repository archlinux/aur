# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-petra
pkgver=1.7
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 16 Petra"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('4d5285838d5c59d7af8d0c5c7d66900f0583e2b26f3cf419d58d1ae1572fd9d8')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-petra
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}-1.7/backgrounds/linuxmint-petra ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}-1.7/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}-1.7/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}-1.7/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}
