# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=kwin-script-tiling
pkgver=2.1
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://store.kde.org/content/show.php?content=161151"
license=('GPL2')
depends=('kwin')
source=("https://github.com/kwin-scripts/kwin-tiling/archive/v${pkgver}.tar.gz")
sha512sums=('cf74c35803c78b9845f0daf5a8ad2d4ec88f68a9dcb1c3a8797c2c4620d384bcdcbf99972e3e021711c6d5b35d2a2f66f9e6cabdb181c3ce7b526b7515b16cd0')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/kwin-tiling-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/kwin-tiling-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
