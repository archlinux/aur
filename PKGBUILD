# Maintainer: Akrata
pkgname=kune-icon-theme
pkgver=1.1.1
pkgrel=1
pkgdesc="Custom Tela icon theme with Papirus apps and Breeze cursors"
arch=("any")
url="https://github.com/Akr4ta/kune-icon-theme"
license=("GPL3")
depends=('papirus-icon-theme')
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d977ade229db64f422a16f34568749e783d4c6eafa8629266bad1a4433626e6b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r kune "${pkgdir}/usr/share/icons/"
  cp -r kune-light "${pkgdir}/usr/share/icons/"
  cp -r kune-dark "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto-light "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto-dark "${pkgdir}/usr/share/icons/"
  cp -r kune-pink "${pkgdir}/usr/share/icons/"
  cp -r kune-pink-light "${pkgdir}/usr/share/icons/"
  cp -r kune-pink-dark "${pkgdir}/usr/share/icons/"
  cp -r kune-manjaro "${pkgdir}/usr/share/icons/"
  cp -r kune-manjaro-light "${pkgdir}/usr/share/icons/"
  cp -r kune-manjaro-dark "${pkgdir}/usr/share/icons/"
}
