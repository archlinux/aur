# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=kwin-script-tiling
pkgver=2.3
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://store.kde.org/content/show.php?content=161151"
license=('GPL2')
depends=('kwin')
source=("https://github.com/kwin-scripts/kwin-tiling/archive/v${pkgver}.tar.gz")
sha512sums=('8e501f0a72f3779aebef935acc2fe9da746f109082340df30506ac880886a88f800de2c159ad8c391fb49d8866a51ebaa6d0e14eeb4038a1f215e28ccb215b54')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/kwin-tiling-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/kwin-tiling-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
