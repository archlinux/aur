# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=yakuake-skin-breeze
pkgver=2025.06.22
pkgrel=1
pkgdesc="Modified Breeze Skin by Andreas Kainz for matching Plasma 6.4 color schemes"
arch=('any')
url="https://store.kde.org/p/2297897"
license=('GPLv2-or-later')
depends=('yakuake')
source=("${pkgname}.tar.gz")
sha256sums=('ebb187a85d71a2d21f040e0cbae1eb0e77d2f6243d2664cfde9d833be3e1c0e5')

package() {
  install -dm755 "${pkgdir}/usr/share/yakuake/skins"
  cp -a "${pkgname}/breeze-"{dark,light,twilight}{,-rb} "${pkgdir}/usr/share/yakuake/skins"
}
