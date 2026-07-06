# Maintainer: Akrata
pkgname=kune-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Custom Tela icon theme with Papirus apps and Sweet cursors"
arch=("any")
url="https://github.com/Akr4ta/kune-icon-theme"
license=("GPL3")
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed00be1fa0f2bb4a31fd4ba5ad977bc66671bdc4ec86c667c43acccca7176b36')

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
