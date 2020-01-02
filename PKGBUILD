# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-lisa
pkgver=1.1
pkgrel=1
pkgdesc="The backgrounds included in Linux Mint 12 Lisa"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('be6c378505a901a62735b12bb615e79723788f5eecba944a930f9811eddec133')

package() {
	mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-lisa
	mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-lisa ${pkgdir}/usr/share/backgrounds
	cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
	cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}