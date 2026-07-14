# Maintainer: Akrata
pkgname=kune-icon-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="Custom Tela icon theme with Papirus apps and Sweet cursors"
arch=("any")
url="https://github.com/Akr4ta/kune-icon-theme"
license=("GPL3")
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8f99c7971bb7bbbdfd886aa8927e5e99fc4d6bf8ce2032bc4017f7e804445a9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r kune "${pkgdir}/usr/share/icons/"
  cp -r kune-light "${pkgdir}/usr/share/icons/"
  cp -r kune-dark "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto-light "${pkgdir}/usr/share/icons/"
  cp -r kune-nokto-dark "${pkgdir}/usr/share/icons/"
}
