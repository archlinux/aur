# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
pkgname=amaranth-font
pkgver=1.0.0
pkgrel=4
pkgdesc="A friendly upright italic design with a slight contrast and distinctive curves"
arch=('any')
url="https://fonts.google.com/specimen/Amaranth"
license=('GPL-2')
source=("Amaranth.zip::https://fonts.google.com/download?family=Amaranth")
md5sums=('c1cfc0a974037f316f9327998d923658')

package () {
  install -d "${pkgdir}/usr/share/fonts/amaranth"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/amaranth/"
  install -m644 OFL.txt "${pkgdir}/usr/share/fonts/amaranth/"
}
