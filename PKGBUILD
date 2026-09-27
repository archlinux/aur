# Maintainer: Akrata
pkgname=neon-icon-theme
pkgver=3.0.0
pkgrel=1
pkgdesc="Line icon theme featuring soft pastel colors for dark themes"
arch=("any")
url="https://github.com/Akr4ta/neon-icon-theme"
license=("GPL3")
makedepends=(git)
optdepends=('papirus-icon-theme: for icons that might be missing')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9179e220d1c6018873c2a94435c8bb9aa6955842c5d6ecf8f7d02cad5eb22a08')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r neon "${pkgdir}/usr/share/icons/"
  cp -r neon-anarchy "${pkgdir}/usr/share/icons/"
  cp -r neon-anarchy-op2 "${pkgdir}/usr/share/icons/"
}
