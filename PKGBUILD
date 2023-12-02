# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=mint-backgrounds-julia
pkgver=1.0
pkgrel=2
pkgdesc="The backgrounds included in Linux Mint 10 Julia"
license=('Various')
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
source=("${url}/${pkgname}_$pkgver.tar.gz")
sha256sums=('3afad858e57bfcc595201125da4c78b3649d5d69f5b2dc4bdcab64a5b7dac62b')

package() {
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint-julia
  mkdir --parents ${pkgdir}/usr/share/{cinnamon-background-properties,gnome-background-properties}

  cp --archive ${srcdir}/${pkgname}/usr/share/backgrounds/linuxmint-julia ${pkgdir}/usr/share/backgrounds
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/cinnamon-background-properties
  cp --archive ${srcdir}/${pkgname}/usr/share/gnome-background-properties/* ${pkgdir}/usr/share/gnome-background-properties
}
