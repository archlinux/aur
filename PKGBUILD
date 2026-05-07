# Maintainer: Akrata
pkgname=akrata-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Line icon theme featuring soft pastel colors for dark themes"
arch=("any")
url="https://github.com/Akr4ta/akrata-icon-theme"
license=("GPL3")
depends=(papirus-icon-theme adwaita-icon-theme)
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e7f45fe4cee9a028bd80f948c02f02ffeb5f98b8742cc7c94cf33704f7ded93e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r akrata-icons-anarchy "${pkgdir}/usr/share/icons/"
  cp -r akrata-icons "${pkgdir}/usr/share/icons/"
  cp -r akrata-icons-anarchy-cosmic "${pkgdir}/usr/share/icons/"
  cp -r akrata-icons-anarchy-cosmicV2 "${pkgdir}/usr/share/icons/"
  cp -r akrata-icons-cosmic "${pkgdir}/usr/share/icons/"
}
