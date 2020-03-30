# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=kwin-script-tiling
pkgver=2.4
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://store.kde.org/content/show.php?content=161151"
license=('GPL2')
depends=('kwin')
source=("https://github.com/kwin-scripts/kwin-tiling/archive/v${pkgver}.tar.gz")
sha512sums=('33c48af55cac0ef4c98dd0da875fda6451b1cd8550159835389a98691bbe325a786cbc5fbaeaba2b0d7b2402ae3015d259578aa4eb3f07779244ed9535660587')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/kwin-tiling-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/kwin-tiling-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
