# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Contributor: urbanslug

pkgname=kwin-scripts-tiling
_pkgname=kwin-script-tiling
pkgver=2.2
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://store.kde.org/content/show.php?content=161151"
license=('GPL2')
depends=('kwin')
source=("https://github.com/kwin-scripts/kwin-tiling/archive/v${pkgver}.tar.gz")
sha512sums=('56384fd344cea314570e14afb3c066073c3b43f83205ddad578ee89593268132b529109de01e232da7d79c24de052e3613aba942e4482d2e3b0e505bfac84012')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/kwin-tiling-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/kwin-tiling-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
