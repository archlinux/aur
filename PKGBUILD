# Maintainer: Seantum <tsiegele AT gmx DOT at>
# Contributor: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-vanessa
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 21 Vanessa"
license=('GPL3')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('8ea148cd78c01a54c1d1ea4d8bbfb8d58ba20ac03cb945014d223f09b8e42b92')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-vanessa
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties,mate-background-properties}

  cp --archive ${srcdir}/${pkgname}/backgrounds/linuxmint-vanessa ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/cinnamon-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
  cp --archive ${srcdir}/${pkgname}/mate-background-properties/* ${pkgdir}/usr/share/mate-background-properties
}

