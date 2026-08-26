# Maintainer: Michael Tindal ( mj.tindal @ gmail.com )

pkgname=ffxiv-teamcraft
pkgdesc="Collaborative crafting tool for Final Fantasy XIV"
pkgver=11.4.30
pkgrel=1
arch=('x86_64')
license=('MIT')
source=(
  FFXIV-Teamcraft.AppImage=https://github.com/ffxiv-teamcraft/ffxiv-teamcraft/releases/download/v${pkgver}/FFXIV-Teamcraft.AppImage
  "FFXIV Teamcraft.desktop"
)
sha1sums=('49cf39d84c48140b83a6597722d4e3ff5d747301'
          '37b0e6795f10261bf76be8d39420b11d14a47180')
options=(!strip)

package() {
  install -m 755 -D -t ${pkgdir}/opt/ffxiv-teamcraft/ FFXIV-Teamcraft.AppImage
  install -m 644 -D -t ${pkgdir}/usr/share/applications/ "FFXIV Teamcraft.desktop"
}
