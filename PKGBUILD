# Maintainer: Akrata
pkgname=kune-icon-theme
pkgver=1.1.0
pkgrel=1
pkgdesc="Custom Tela icon theme with Papirus apps and Sweet cursors"
arch=("any")
url="https://github.com/Akr4ta/kune-icon-theme"
license=("GPL3")
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d38f7620a708d5cb052d24cb9836c2190fd570d318e5bb42cbafcef2aa86d36f')

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
