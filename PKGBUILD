# Maintainer: Akrata
pkgname=akrata-icon-theme
pkgver=2.0.0
pkgrel=2
pkgdesc="Line icon theme featuring soft pastel colors for dark themes"
arch=("any")
url="https://github.com/Akr4ta/akrata-icon-theme"
license=("GPL3")
makedepends=(git)
optdepends=('papirus-icon-theme: for icons that might be missing')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0998ab35aba2f785608aefeabfd51ed22d14a50e285832b8d486cef489d483bd')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r akrata "${pkgdir}/usr/share/icons/"
  cp -r akrata-anarchy "${pkgdir}/usr/share/icons/"
  cp -r akrata-anarchy-op2 "${pkgdir}/usr/share/icons/"
}
