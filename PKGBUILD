# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-nadia
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 14 Nadia"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('f12b0bbf515b32ac63df86f577c9179a1417762937357bac7977beb2bac55c23')

package() {
	mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-nadia
	mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-nadia ${pkgdir}/usr/share/backgrounds
	cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
	cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}